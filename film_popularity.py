#bar showing most common film catgories in stock
from matplotlib import pyplot as plt
import pandas as pd

df = pd.read_csv('film_category_by_count.csv')

counts = df['count']
categories = df['category']

plt.xticks(range(5),categories)
plt.ylabel('Number in Stock')
plt.title('5 Most Common Film Categories')
plt.bar(range(5),counts[:5],color='orangered')
plt.show()