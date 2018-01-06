from matplotlib import pyplot as plt
import pandas as pd

df = pd.read_csv('most_common_actors.csv')
num_appears = df['num_appear']
first_names = df['first_name']
last_names = df['last_name']

#I do not have access to microsoft excel at home currently
#so the first and last names are being merged here in python instead
full_names =[]
for idx,name in enumerate(first_names):
  full_names.append(name + last_names[idx])

plt.bar(range(5),num_appears[:5],color='orangered')
plt.xticks(range(5),full_names[:5])
plt.ylabel('Number of Appearances')
plt.title('Most Common Actors')
plt.show()

df2 = pd.read_csv('most_common_cities.csv')
city = df2['city']
count = df2['count']

plt.pie(count,explode=None,labels=city)
plt.title('Most Common Cities Customers Live in')
plt.show()