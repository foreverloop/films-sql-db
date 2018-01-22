import pandas as pd
from matplotlib import pyplot as plt

df = pd.read_csv('csv/most_rentals_by_staff.csv')
plt.pie(df['rental_count'],explode=None,labels=df['forename'])
plt.show()

plt.xticks(range(2),df['forename'])
plt.bar(range(2),df['rental_count'],color='purple')
plt.show()