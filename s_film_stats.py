from matplotlib import pyplot as plt
import pandas as pd

df = pd.read_csv('most_common_actors.csv')
num_appears = df['num_appear']
first_names = df['first_name']
last_names = df['last_name']

plt.bar(range(5),num_appears[:5],color='orangered')
plt.ylabel('Number of Appearances')
plt.title('Most Common Actors')
plt.show()

df2 = pd.read_csv('most_common_cities.csv')
city = df2['city']
count = df2['count']

plt.pie(count,explode=None,labels=city)
plt.title('Most Common Cities Customers Live in')
plt.show()