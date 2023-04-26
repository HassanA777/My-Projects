import pandas as pd

masterListTest = pd.read_csv('Master List Table.csv')
keep_col_index = masterListTest.columns.get_loc("site_id")
masterListTest.drop(masterListTest.columns[:keep_col_index],axis = 1, inplace=True)
masterListTest.to_csv('Master List Table.csv')