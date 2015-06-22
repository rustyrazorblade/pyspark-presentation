export SPARK_MASTER_IP=127.0.0.1

start-spark() {
    cd /usr/local/spark-1.3.1-bin-cdh4
    sbin/start-master.sh
    sbin/start-slave.sh 1 spark://127.0.0.1:7077
}

export PYSPARK_ROOT=/Users/jhaddad/dev/pyspark-cassandra/target
export PYSPARK_VERSION=0.1.5
export PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS="notebook"

pys() {
    pyspark \
        --jars ${PYSPARK_ROOT}/pyspark_cassandra-${PYSPARK_VERSION}.jar  \
        --driver-class-path ${PYSPARK_ROOT}/pyspark_cassandra-${PYSPARK_VERSION}.jar \
        --py-files ${PYSPARK_ROOT}/pyspark_cassandra-${PYSPARK_VERSION}-py2.7.egg \
        --conf spark.cassandra.connection.host=127.0.0.1 \
        --master spark://127.0.0.1:7077
}

submit() {
    spark-submit \
    --jars ${PYSPARK_ROOT}/pyspark_cassandra-${PYSPARK_VERSION}.jar  \
    --driver-class-path ${PYSPARK_ROOT}/pyspark_cassandra-${PYSPARK_VERSION}.jar \
    --py-files ${PYSPARK_ROOT}/pyspark_cassandra-${PYSPARK_VERSION}-py2.7.egg \
    --conf spark.cassandra.connection.host=127.0.0.1 \
    --master spark://127.0.0.1:7077 \
    $1

}
