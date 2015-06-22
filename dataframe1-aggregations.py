from pyspark_cassandra import CassandraSparkContext, Row
from pyspark import SparkContext, SparkConf
from pyspark.sql import SQLContext # needed for toDF()

conf = SparkConf() \
    .setAppName("User Food Migration") \
    .setMaster("spark://127.0.0.1:7077") \
    .set("spark.cassandra.connection.host", "127.0.0.1")

sc = CassandraSparkContext(conf=conf)
sql = SQLContext(sc)

users = sc.cassandraTable("demo", "user").toDF()
food_count = users.select("favorite_food").groupBy("favorite_food").count()
