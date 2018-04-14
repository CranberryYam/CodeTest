import json
from datetime import datetime


def readJson(filePath):
    with open(filePath) as json_file:
        json_data = json.load(json_file)
        return json_data

def getMonthDic(dic):
    result = dict()
    for name, birthString in dic.items():
        birthDate = datetime.strptime(birthString, '%m/%d/%Y')
        monthStr = birthDate.strftime('%B')
        if monthStr in result:
           result[monthStr] +=1
        else:
           result[monthStr] = 1
    return result

dic = readJson('data.json')
result = getMonthDic(dic)
print(result)

