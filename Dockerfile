# VERSION 1
# Author: jingchao.song

# Base images
FROM 10.10.36.213/library/jdk7:7u80

# Maintainer
MAINTAINER jingchaosong jingchao.song@tendcloud.com

ADD ./hadoop-2.6.0-cdh5.5.2 /usr/local/hadoop/

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

ADD ./conf/* /usr/local/hadoop/etc/hadoop/

ADD ./lib/* /usr/local/hadoop/lib/native/

CMD ["startup.sh"]
