import pandas as pd
import re
import seaborn as sns
import matplotlib.pyplot as plt
import mplcursors
import nltk

from datetime import datetime
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import CountVectorizer
from collections import Counter

stop_words = set(stopwords.words('english'))
fileName = "Nestle.json"
extra_stop_words = {"all","also","an","and","any","are","as","at","be","been","but","by","can","could","do","does","for","from",
"had","has","have","he","her","his","if","in","into","is","it","its","may","might","more","most","no","not","of","on","or","our",
"shall","should","so","than","that","the","their","then","there","they","this","to","us","was","we","were","which","with","would",
"you", "nestle","like","per","thanks","need","12","08","30","10","07","c9","c10","c8","14","get","yes","20","it"}
stop_words = stop_words.union(extra_stop_words)

def generate_ngrams(text, n):
    ngrams = []
    for i in range(len(text)-n+1):
        ngrams.append(text[i:i+n])
    return ngrams

def generate_ngram_counts(text_series, n):
    vectorizer = CountVectorizer(ngram_range=(n,n),lowercase=True)
    ngram_counts = vectorizer.fit_transform(text_series)
    feature_counts = dict(zip(vectorizer.get_feature_names_out(), ngram_counts.sum(axis=0).tolist()[0]))
    top_ngrams = sorted(feature_counts.items(), key=lambda x: x[1], reverse=True)[:10]
    top_ngrams_dicts = [{'ngram': ngram, 'count': count} for ngram, count in top_ngrams]
    return top_ngrams_dicts

def remove_stopwords(text):
    words = text.split()
    words = [w.lower() for w in words if not w.lower() in stop_words]
    return " ".join(words)

# Define a function to extract words from a string
def extract_words(text):
    words = re.findall(r'\b\w+\b', text.lower())
    return words

# Set the appropriate data types for each column
dtypes = {"text": str, "ts": float, "user": str}
# Use the pandas.read_json() function to read in the JSON file and convert it directly into a Pandas dataframe
dataFrame = pd.read_json(fileName, dtype=dtypes)
dataFrame['ts'] = pd.to_datetime(dataFrame['ts'], unit='s')
# Convert the "ts" column to the desired timestamp format (24-hour standard timestamp, rounded to the nearest minute)
dataFrame['Date'] = dataFrame['ts'].dt.strftime('%m/%d/%Y')
dataFrame['Time'] = dataFrame['ts'].dt.round('1min').dt.time
dataFrame['Time'] = dataFrame['Time'].apply(lambda x: x.strftime('%H:%M'))
dataFrame = dataFrame[dataFrame['text'].str.match(r'^\w')]
mask = (dataFrame['text'].str.len() <= 1)
# Drop the selected rows from the dataframe
dataFrame.drop(dataFrame[mask].index, inplace=True)
user_map = {}
user_id = 0
for user in dataFrame['user'].unique():
    user_map[user] = f"User_{user_id}"
    user_id += 1
# Replace each unique value in the "user" column with "User_x"
dataFrame['user'] = dataFrame['user'].map(user_map)
dataFrame['Year'] = dataFrame['ts'].dt.year
dataFrame['Week'] = dataFrame['ts'].dt.strftime('%U')
# apply the function to the "text" column and save the results to a new column "newText"
dataFrame['newText'] = dataFrame['text'].apply(remove_stopwords)
# Group the new dataframe by the "Date" column

# Group the dataframe by week and generate ngram counts for each week
week_groups = dataFrame.groupby(['Year','Week'])['newText']
week_data = []

# Iterate through each week group and generate ngram counts
for week, week_group in week_groups:
    # Generate the ngram counts for each column
    if len(week_group) > 1:
        n1_counts = generate_ngram_counts(week_group, 1)
        n2_counts = generate_ngram_counts(week_group, 2)
        n3_counts = generate_ngram_counts(week_group, 3)

        week_dict = {'week': week, 'n_1': n1_counts, 'n_2': n2_counts, 'n_3': n3_counts}
        
        # Append the week data to the list
        week_data.append(week_dict)
    
wordsByWeek = pd.DataFrame(week_data)
wordsByWeek['top n_1'] = ""
wordsByWeek['top n_2'] = ""
wordsByWeek['top n_3'] = ""

wordsByWeek['top n_1 word'] = ''
wordsByWeek['top n_1 count'] = ''

wordsByWeek['top n_2 word'] = ''
wordsByWeek['top n_2 count'] = ''

wordsByWeek['top n_3 word'] = ''
wordsByWeek['top n_3 count'] = ''

# Iterate through each row of the dataframe
for i, row in wordsByWeek.iterrows():
    
    # Get the n_1 column for this row
    n1_list = row['n_1']
    n2_list = row['n_2']
    n3_list = row['n_3']

    # Initialize variables to store the top n_1 ngrams and their counts
    top_n1_ngrams = []
    top_n1_counts = []
    top_n2_ngrams = []
    top_n2_counts = []
    top_n3_ngrams = []
    top_n3_counts = []
    
    # Iterate through the list of n_1 ngrams
    for n1_dict in n1_list:
        
        # Get the count for this ngram
        count = n1_dict['count']
        
        # If this count is greater than the current top counts, update the top ngrams and counts
        if count > max(top_n1_counts, default=0):
            top_n1_ngrams = [n1_dict['ngram']]
            top_n1_counts = [count]
        elif count == max(top_n1_counts):
            top_n1_ngrams.append(n1_dict['ngram'])
            top_n1_counts.append(count)
    
    # Update the 'top n_1' column for this row with the top ngrams and their counts
    wordsByWeek.at[i, 'top n_1'] = list(zip(top_n1_ngrams, top_n1_counts))

    for n2_dict in n2_list:
        
        # Get the count for this ngram
        count = n2_dict['count']
        
        # If this count is greater than the current top counts, update the top ngrams and counts
        if count > max(top_n2_counts, default=0):
            top_n2_ngrams = [n2_dict['ngram']]
            top_n2_counts = [count]
        elif count == max(top_n2_counts):
            top_n2_ngrams.append(n2_dict['ngram'])
            top_n2_counts.append(count)
    
    # Update the 'top n_1' column for this row with the top ngrams and their counts
    wordsByWeek.at[i, 'top n_2'] = list(zip(top_n2_ngrams, top_n2_counts))

    for n3_dict in n3_list:
        
        # Get the count for this ngram
        count = n3_dict['count']
        
        # If this count is greater than the current top counts, update the top ngrams and counts
        if count > max(top_n3_counts, default=0):
            top_n3_ngrams = [n3_dict['ngram']]
            top_n3_counts = [count]
        elif count == max(top_n3_counts):
            top_n3_ngrams.append(n3_dict['ngram'])
            top_n3_counts.append(count)
    
    # Update the 'top n_1' column for this row with the top ngrams and their counts
    wordsByWeek.at[i, 'top n_3'] = list(zip(top_n3_ngrams, top_n3_counts))

i=0
for eachList in wordsByWeek['top n_1']:
    stringOfWords = ""
    for eachElement in eachList:
        stringOfWords = stringOfWords + " , " + eachElement[0]
    wordsByWeek['top n_1 word'][i] = stringOfWords.strip(',')
    wordsByWeek['top n_1 count'][i] = eachElement[1]
    i+=1
i=0

sns.set_style("darkgrid")

# Define the plot using the data from the dataframe
plot = sns.pointplot(x="week", y="top n_1 count", data=wordsByWeek)

# Add labels for each point using the "top n_1 words" column
plt.xticks(rotation=90)
max_y = wordsByWeek["top n_1 count"].max()
for i, word in enumerate(wordsByWeek["top n_1 word"]):
    offset = max_y * 0.02 # 2% of maximum value
    plot.annotate(word, xy=(i, wordsByWeek.iloc[i]["top n_1 count"]), xytext=(0,offset), 
                  textcoords='offset points', ha='center', fontsize=8, alpha=0)

# Add interactivity to the plot using mplcursors
cursor = mplcursors.cursor(plot, hover=True)
@cursor.connect("add")
def on_add(sel):
    x, y = sel.target
    index = int(x)
    word = wordsByWeek.iloc[index]["top n_1 word"]
    sel.annotation.set_text(word)
    sel.annotation.set_visible(True)

plt.title("Top n_1 Words by Week")
plt.show()

cleanDF = pd.DataFrame(columns = ["Week","top n_1 word","top n_1 count","top n_2 word","top n_2 count","top n_3 word","top n_3 count"])
