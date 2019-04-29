# thrive-mysql
MySQL database to store analysis results and other data.

## To run the database standalone
```
docker run -p 3307:3306 -e MYSQL_ROOT_PASSWORD=thrivemysql thriveitcr/thrive-mysql
```
## Standalone Python code for inserting a heterogeneity metric into the database
```
import mysql.connector
cnx = mysql.connector.connect(user='root',password='thrivemysql',host='localhost',database='thrivedb', port=3307)
cursor = cnx.cursor()
add_metric = "INSERT INTO heterogeneity_metric (slide_name, region_name, branch_name, metric_name, metric_value) VALUES (%s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE metric_value=%s"
data = ("AGA_3", "003", "default", "mymetric", "9.9", "9.9")
cursor.execute(add_metric, data)
cnx.commit()
cursor.close()
cursor = cnx.cursor()
query = "SELECT * FROM heterogeneity_metric;"
cursor.execute(query)
for x in cursor:
    print(x)
cursor.close()
cnx.close()
```