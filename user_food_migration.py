from pyspark_cassandra import CassandraSparkContext, Row
from pyspark import SparkContext, SparkConf

conf = SparkConf() \
    .setAppName("User Food Migration") \
    .setMaster("spark://127.0.0.1:7077") \
    .set("spark.cassandra.connection.host", "127.0.0.1")

sc = CassandraSparkContext(conf=conf)

users = sc.cassandraTable("demo", "user")

favorite_foods = users.map(lambda x: Row(**{"food":x['favorite_food'], "name":x['name']}) )
favorite_foods.saveToCassandra("demo", "favorite_foods")
