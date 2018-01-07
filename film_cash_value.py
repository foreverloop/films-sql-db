from scipy.stats import pearsonr
from matplotlib import pyplot as plt
import pandas as pd

df = pd.read_csv('most_profitable.csv')

categories = df['category']
price_values = df['value']
stock = df['stock']

#this indicates there is a strong correlation between these two variables
#and it makes sense, if there is more of a type of film, it will be worth more overall
print "Pearson's correlation and p-value {0}: ".format(pearsonr(stock,price_values))

#basic scatter showing stock and price value
plt.scatter(stock,price_values,color='orangered')
plt.title('Stock vs Value')
plt.xlabel('Amount in stock')
plt.ylabel('value in $')
plt.show()

#value of each type of film
plt.bar(range(len(categories)),price_values,color='green')
plt.tick_params(axis='both', which='major', labelsize=4)
plt.xticks(range(len(categories)),categories)
plt.ylabel('Price value ($)')
plt.title('Value of Each Category of Film')
plt.show()

#market share
plt.pie(price_values,explode=None,labels=categories)
plt.title('Share of Market by Film Type')
plt.show()

#stock by category
plt.bar(range(len(categories)),stock,color='purple')
plt.title('Number in Stock by Category')
plt.tick_params(axis='both', which='major', labelsize=4)
plt.xticks(range(len(categories)),categories)
plt.ylabel('No. in Stock')
plt.show()
