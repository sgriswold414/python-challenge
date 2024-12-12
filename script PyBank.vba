# -*- coding: UTF-8 -*-

import csv
import os

dirname = os.path.dirname(__file__)
file_to_load = os.path.join(dirname,"Resources", "budget_data.csv")
file_to_output = os.path.join(dirname, "analysis", "budget_analysis.txt")

total_months = 0
total_net = 0
total_difference = 0
change_from_prior_month = 0
list_of_months = []
list_of_profits = []

with open(file_to_load, 'r') as financial_data:
    reader = csv.reader(financial_data, delimiter=',')

    header = next(reader)

    for row in reader:
        total_months = total_months + 1
        
        profit = row[1]
        month = row[0]
        profit = int(profit)
        if total_months >= 2:
            print(profit,previous_profit)
            list_of_months.append(month)
            total_difference = total_difference + profit - previous_profit
            list_of_profits.append(profit-previous_profit)
        total_net = total_net + profit
        previous_profit = profit
        print(row)
    average_difference = total_difference/(total_months - 1)
    average_difference = round(average_difference, 2)  
    greatest = max(list_of_profits)
    decrease = min(list_of_profits)
    index_greatest = list_of_profits.index(greatest)
    index_decrease = list_of_profits.index(decrease)
    date_greatest = list_of_months[index_greatest]
    date_decrease = list_of_months[index_decrease]

print(total_months)

print(total_net)

print(total_difference)

print(average_difference)

print(list_of_months)

print(list_of_profits)

print(date_greatest,greatest)

print(date_decrease,decrease)

with open(file_to_output, 'w') as financial_data:
    financial_data.write("Financial Analysis\n")
    financial_data.write("\n")
    financial_data.write("----------------------------\n")
    financial_data.write("\n")
    financial_data.write(f"Total Months: {total_months}\n")
    financial_data.write("\n")
    financial_data.write(f"Total: ${total_net}\n")
    financial_data.write("\n")
    financial_data.write(f"Average Change: ${average_difference}\n")
    financial_data.write("\n")
    financial_data.write(f"Greatest Increase in Profits: {date_greatest} (${greatest})\n")
    financial_data.write("\n")
    financial_data.write(f"Greatest Decrease in Profits: {date_decrease} (${decrease})\n")