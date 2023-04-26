import unificontrol
import datetime
from datetime import timezone
import pandas as pd
from pathlib import Path
import time
macList = []
ouiList = []
tDay = datetime.date.today()
yDay = tDay - datetime.timedelta(days = 1) 
statisticsTable = pd.DataFrame(columns=['macList','ouiList'])

data = pd.read_csv('Master List Table.csv')
keep_col_index_master = data.columns.get_loc("site_id")
data.drop(data.columns[:keep_col_index_master],axis = 1, inplace=True)

currentData = pd.DataFrame()
client = unificontrol.UnifiClient(host='192.168.100.114', port= 8443, username='gsaiunifi_2', password='Handsome20.23', site='default')
currentData = currentData.append(client.list_clients())

timeNow = datetime.datetime.now()
currentData['Time Stamp'] = str(timeNow)
keep_col_index_current = currentData.columns.get_loc("site_id")
currentData.drop(currentData.columns[:keep_col_index_current],axis = 1, inplace=True)
path = r'C:\Users\HassanAluraibi\Desktop\VS Code\Unifi'
data = pd.concat([data,currentData], ignore_index = True)
data.to_csv(path + '\Master List Table.csv')