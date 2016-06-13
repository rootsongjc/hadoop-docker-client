# VERSION 1
# Author: jingchao.song

# Base images
FROM 10.10.36.213/library/jdk7:7u80

# Maintainer
MAINTAINER jingchaosong jingchao.song@tendcloud.com

ADD ./hadoop-2.6.0-cdh5.5.2 /usr/local/hadoop/
ADD ./hadoop-conf/ /usr/local/hadoop/etc/hadoop/

ENV HA yes
ENV NAMESERVICE dcnameservice
ENV ACTIVE_NAMENODE_IP bj-dc-namenode-001.tendcloud.com
ENV STANDBY_NAMENODE_IP bj-dc-namenode-002.tendcloud.com
ENV ACTIVE_NAMENODE_ID namenode79
ENV STANDBY_NAMENODE_ID namenode129
ENV HA_ZOOKEEPER_QUORUM bj-dc-jn-001.tendcloud.com:2181,bj-dc-jn-002.tendcloud.com:2181,bj-dc-namenode-001.tendcloud.com:2181,bj-dc-namenode-002.tendcloud.com:2181,bj-dc-yarn-001.tendcloud.com:2181,bj-dc-yarn-002.tendcloud.com:2181,bj-dc-zk-001.tendcloud.com:2181
ENV YARN_ZK_DIR yarn1
ENV YARN_CLUSTER_ID yarn1
ENV YARN_RM1_IP bj-dc-yarn1-rm1.tendcloud.com
ENV YARN_RM2_IP bj-dc-yarn1-rm2.tendcloud.com
ENV YARN_JOBHISTORY_IP bj-dc-yarn1-rm1.tendcloud.com
ENV NAMENODE_IP bj-dc-namenode-001.tendcloud.com
ENV RESOURCEMANAGER_IP bj-dc-namenode-001.tendcloud.com
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH "/usr/local/hadoop/bin:/usr/local/hadoop/sbin:$PATH"
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_HOME/etc/hadoop
RUN echo "export HADOOP_HOME=/usr/local/hadoop">>/etc/profile && \
echo "export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop">>/etc/profile && \
echo "export YARN_CONF_DIR=/usr/local/hadoop/etc/hadoop">>/etc/profile && \
echo "PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${SPARK_HOME}/bin:${PATH}">>/etc/profile && \
echo "CLASSPATH=.:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar">>/etc/profile

ADD scripts/startup.sh /usr/bin/

ADD ./lib/* /usr/local/hadoop/lib/native/

CMD ["startup.sh"]
