import psycopg2
import numpy as np
import matplotlib.pyplot as plt
# Update connection string information
host = "gpt2001.postgres.database.azure.com"
dbname = "postgres"
user = "examiner@gpt2001"
password = "3366"
sslmode = "require"

# Construct connection string
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")

cursor = conn.cursor()


# 1o erwthma - Number of movies per year -
cursor.execute("SELECT EXTRACT(YEAR FROM release_date) as Year, COUNT(id) as Number_of_Movies FROM movie WHERE EXTRACT(YEAR FROM release_date) IS NOT Null GROUP BY EXTRACT(YEAR FROM release_date)  ORDER BY EXTRACT(YEAR FROM release_date);")
rows = cursor.fetchall()

# Print all rows
for row in rows:
    print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[0])
    lsy.append(row[1])
fig = plt.figure(figsize = (10, 5))
plt.title("Number of Movies By Year")
plt.xlabel('Year')
plt.ylabel('Number of Movies')
plt.bar(lsx,lsy,color ='maroon')
plt.show()

# 2o erwthma - Number of movies per Genre -
cursor.execute("SELECT g.name, COUNT(g.id) FROM movie_genres as mg,genre as g WHERE g.id = mg.genre_id GROUP BY g.name;")
rows = cursor.fetchall()

# Print all rows
for row in rows:
    print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[0])
    lsy.append(row[1])
fig = plt.figure(figsize = (10, 5))
plt.title("Number of Movies Per Genre")
plt.xlabel('Genre')
plt.ylabel('Number of Movies')
plt.bar(lsx,lsy,color ='darkcyan')
plt.show()

# 4o erwthma - Number of movies Per year and Per Genre - 
cursor.execute("SELECT g.name, EXTRACT(YEAR FROM release_date), COUNT(g.id) FROM movie_genres as mg,genre as g,movie as m WHERE g.id = mg.genre_id AND m.id = mg.movie_id AND EXTRACT(YEAR FROM release_date) IS NOT NULL GROUP BY g.name,EXTRACT(YEAR FROM release_date) ;")
rows = cursor.fetchall()

# Print all rows
for row in rows:
    print("Data row = (%s, %s, %s)" %(str(row[0]), str(row[1]),str(row[2])))

xVal = []
yVal = []
zVal = []

for row in rows:
    xVal.append(row[0])
    yVal.append(row[1])
    zVal.append(row[2])

# Initializing Figure
fig = plt.figure()
ax1 = fig.add_subplot(111, projection='3d')
ax1.set_facecolor((1.0, 1.0, 1.0))
# Creating a dictionary from categories to x-axis coordinates
xCategories = xVal
i=0
xDict = {}
x=[]
for category in xCategories:
  if category not in xDict:
    xDict[category]=i
    x.append(i)
    i+=1
  else:
    x.append(xDict[category])
# Defining the starting position of each bar (x is already defined)
z = np.zeros(len(x))
# Defining the length/width/height of each bar.
dx = np.ones(len(x))*0.1
dy = np.ones(len(x))
dz = zVal
ax1.bar3d(x, yVal, z, dx, dy, dz)
ax1.set_zlim([0, max(zVal)])
plt.xticks(range(len(xDict.values())), xDict.keys())
plt.show()

#4o erwthma - Max budget of a movie per year -
cursor.execute("SELECT MAX(m.budget) as Maximum_Budget_of_the_Year, EXTRACT(YEAR FROM release_date) AS Year FROM movie as m WHERE EXTRACT(YEAR FROM release_date) IS NOT Null GROUP BY EXTRACT(YEAR FROM release_date);")

rows = cursor.fetchall()

# Print all rows
for row in rows:
    print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[1])
    lsy.append(row[0])
fig = plt.figure(figsize = (10, 5))
plt.title("Maximum Budget Per Year")
plt.xlabel('Year')
plt.ylabel('Maximum Budget')
plt.grid()
plt.bar(lsx,lsy,color ='mediumorchid')
plt.show()

#5o erwthma - Geaorge Clooney - 
cursor.execute("SELECT SUM(movie.revenue) as revenue,EXTRACT(YEAR FROM release_date)as year FROM person,movie,movie_cast,actor where person.name = 'George Clooney' AND movie_cast.person_id = person.id AND person.id = actor.person_id AND movie.id = movie_cast.movie_id GROUP BY EXTRACT(YEAR FROM release_date) ORDER BY EXTRACT(YEAR FROM release_date);")
rows = cursor.fetchall()

# Print all rows
for row in rows:
    print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[1])
    lsy.append(row[0])
fig = plt.figure(figsize = (10, 5))
plt.title("George Clooney's total revenue per Year")
plt.xlabel('Year')
plt.ylabel('Total revenue')
plt.bar(lsx,lsy,color ='goldenrod')
plt.show()

#6o erwthma - Average rating per user - 
cursor.execute("SELECT user_id ,AVG(rating) FROM ratings GROUP BY user_id Order By user_id;")
rows = cursor.fetchall()

# Print all rows
# for row in rows:
#     print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[0])
    lsy.append(row[1])
plt.title("Average Rating By User")
x = np.array(lsx)
y = np.array(lsy)
plt.ylabel('Average rating')
plt.xlabel('User id')
plt.scatter(x, y,s = 1,c = "b",alpha = 0.5,marker = r'$\clubsuit$')
plt.show()

#7o erwthma - Number of ratings per user -
cursor.execute("SELECT COUNT(rating),ratings.user_id FROM ratings GROUP BY user_id ORDER BY user_id;")
rows = cursor.fetchall()

lsx = []
lsy = []

for row in rows:
    lsx.append(row[1])
    lsy.append(row[0])
plt.title("Number of ratings per user")
x = np.array(lsx)
y = np.array(lsy)
plt.ylabel('Number of ratings')
plt.xlabel('User id')
plt.scatter(x, y,s = 1,c = "darkred",marker = 'd')
plt.show()

#8o erwthma - Number of ratings per user and average rating -
cursor.execute("SELECT COUNT(rating),AVG(ratings.rating),ratings.user_id FROM ratings GROUP BY user_id ORDER BY user_id;")
rows = cursor.fetchall()

# Print all rows
# for row in rows:
#     print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[0])
    lsy.append(row[1])

plt.title("Number of ratings and average rating per user")

x = np.array(lsx)
y = np.array(lsy)
plt.xlabel('Number of ratings per user')
plt.ylabel('Average rating per user')
plt.scatter(x, y,s = 1,c = "crimson",marker = 'd')
plt.show()

#9o erwthma - Average rating for every movie per genre -
cursor.execute("SELECT AVG(rating),genre.name FROM genre,ratings,movie_genres WHERE genre.id = movie_genres.genre_id AND movie_genres.movie_id = ratings.movie_id GROUP BY genre.id;")

rows = cursor.fetchall()

# Print all rows
for row in rows:
    print("Data row = (%s, %s)" %(str(row[0]), str(row[1])))

lsx = []
lsy = []

for row in rows:
    lsx.append(row[1])
    lsy.append(row[0])
#fig = plt.figure(figsize = (10, 5))
plt.title("Average rating per genre")
plt.xlabel('Genre')
plt.ylabel('Average Rating')
plt.bar(lsx,lsy,color ='mediumaquamarine')
plt.show()

# Clean up
conn.commit()
cursor.close()
conn.close()