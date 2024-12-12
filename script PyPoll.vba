# -*- coding: UTF-8 -*-

import csv
import os

dirname = os.path.dirname(__file__)
file_to_load = os.path.join(dirname, "Resources", "election_data.csv")
file_to_output = os.path.join(dirname, "analysis", "election_analysis.txt")

Total_votes = 0

with open (file_to_load, 'r') as election_data:
    reader = csv.reader(election_data)
    header = next(reader)
    result = {}
    for line in reader:
        candidate = line[2]
        Total_votes += 1
        if candidate in result:
            result[candidate]['vote_count'] += 1
        else:
            result[candidate] = {'vote_count': 1}
    winner = list(result.keys())[0]
    output = []
    for candidate in result:
        result[candidate]['percentage_vote'] = (result[candidate]['vote_count']/ Total_votes) * 100
        result[candidate]['candidate'] = candidate
        if result[winner]['vote_count'] < result[candidate]['vote_count']:
            winner = candidate
        output.append(result[candidate])    
             
with open(file_to_output, 'w') as output_file:
    output_file.write("Election Results\n")
    output_file.write("--------------------------\n")
    print('Total Votes: ', Total_votes)
    output_file.write('Total Votes: {} \n'.format(Total_votes))
    print('-------------------------')
    output_file.write('------------------------- \n')
    for candidate in sorted(output, key= lambda x: x['vote_count']):      
        print('{}: {}% ({})'.format(candidate['candidate'], round(candidate['percentage_vote'], 3), candidate['vote_count']))
        output_file.write('{}: {}% ({}) \n'.format(candidate['candidate'], round(candidate['percentage_vote'], 3), candidate['vote_count']))
    print('-------------------------')
    output_file.write('------------------------- \n')
    print('Winner: ',winner)
    output_file.write('Winner: {}'.format(winner))
