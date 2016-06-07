#!/bin/bash
#Init the hadoop configuration
#Author:jingchao.song@tendcloud.com
#Date:2016-06-07

#conf=../conf/hadoop-client.conf
#function getconf {
#item=$1
#result=`grep $item $conf|cut -d "=" -f2`
#echo $result
#}
#NAMESERVICE=`getconf "NAMESERVICE"`
#ACTIVE_NAMENODE_IP=`getconf "ACTIVE_NAMENODE_IP"`
#STANDBY_NAMENODE_IP=`getconf "STANDBY_NAMENODE_IP"`
#ACTIVE_NAMENODE_ID=`getconf "ACTIVE_NAMENODE_ID"`
#STANDBY_NAMENODE_ID=`getconf "STANDBY_NAMENODE_ID"`
#HA_ZOOKEEPER_QUORUM=`getconf "HA_ZOOKEEPER_QUORUM"`
#YARN_ZK_DIR=`getconf "YARN_ZK_DIR"`
#YARN_CLUSTER_ID=`getconf "YARN_CLUSTER_ID"`
#YARN_RM1_IP=`getconf "YARN_RM1_IP"`
#YARN_RM2_IP=`getconf "YARN_RM2_IP"`
#YARN_JOBHISTORY_IP=`getconf "YARN_JOBHISTORY_IP"`

#Edit hadoop configuration

sed -i -E "s/NAMESERVICE/$NAMESERVICE/g" $HADOOP_HOME/etc/hadoop/core-site.xml
sed -i -E "s/NAMESERVICE/$NAMESERVICE/g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i -E "s/ACTIVE_NAMENODE_IP/$ACTIVE_NAMENODE_IP/g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i -E "s/ACTIVE_NAMENODE_ID/$ACTIVE_NAMENODE_ID/g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i -E "s/STANDBY_NAMENODE_IP/$STANDBY_NAMENODE_IP/g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i -E "s/STANDBY_NAMENODE_ID/$STANDBY_NAMENODE_ID/g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i -E "s/HA_ZOOKEEPER_QUORUM/$HA_ZOOKEEPER_QUORUM/g" $HADOOP_HOME/etc/hadoop/hdfs-site.xml
sed -i -E "s/YARN_ZK_DIR/$YARN_ZK_DIR/g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
sed -i -E "s/YARN_CLUSTER_ID/$YARN_CLUSTER_ID/g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
sed -i -E "s/YARN_RM1_IP/$YARN_RM1_IP/g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
sed -i -E "s/YARN_RM2_IP/$YARN_RM2_IP/g" $HADOOP_HOME/etc/hadoop/yarn-site.xml
sed -i -E "s/YARN_JOBHISTORY_IP/$YARN_JOBHISTORY_IP/g" $HADOOP_HOME/etc/hadoop/mapred-site.xml

#Foreground
echo "Press Ctrl+P and Ctrl+Q to background this process."
echo 'Use exec command to open a new bash instance for this instance (Eg. "docker exec -i -t CONTAINER_ID bash"). Container ID can be obtained using "docker ps" command.'
echo "Start Terminal"
bash
echo "Press Ctrl+C to stop instance."
sleep infinity
