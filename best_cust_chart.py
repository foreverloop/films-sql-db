from matplotlib import pyplot as plt
import pandas as pd
df = pd.read_csv('csv/best_customers.csv')

first_names = df['first_name']
last_names = df['last_name']
amounts = df['amount']

full_names = []

for idx,name in enumerate(first_names):
    full_names.append(name + " " + last_names[idx])

plt.xticks(range(5),full_names)
plt.title('Best Customers by Dollar Value')
plt.ylabel('Dollars spent ($)')
plt.bar(range(5),amounts,color='orangered')
plt.show()