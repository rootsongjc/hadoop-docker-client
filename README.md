#Hadoop Docker Client

Build and run an hadoop docker client, pass the config item to hadoop configuration files through docker ENV.

###Build image

```
docker build -t hadoop-client:v0.1 .
```

###Run image

For example

With hadoop ha

```
docker run -d --name=hadoop-client-withha -e NAMESERVICE=addmp -e ACTIVE_NAMENODE_ID=namenode29 -e STANDBY_NAMENODE_ID=namenode63 -e HA_ZOOKEEPER_QUORUM=172.16.20.50:2181,172.16.20.51:2181,172.16.20.52:2181 -e YARN_ZK_DIR=rmstore -e YARN_CLUSTER_ID= yarnRM -e YARN_RM1_IP=172.16.20.52 -e YARN_RM2_IP=172.16.20.51 -e YARN_JOBHISTORY_IP=172.16.20.52 -e ACTIVE_NAMENODE_IP=172.16.20.50 -e STANDBY_NAMENODE_IP=172.16.20.51  -e HA=yes hadoop-client:v0.1
```

Without hadoop ha

```
docker run -d --name=hadoop-client-withoutha -e NANENODE_IP=172.16.31.63 -e RESOURCEMANAGER_IP=172.16.31.63 -e HISTORYSERVER_IP=172.16.31.63 -e HA=no hadoop-client:v0.1
```

###ENV included with hadoop HA

- NAMESERVICE

- ACTIVE_NAMENODE_IP

- STANDBY_NAMENODE_IP

- ACTIVE_NAMENODE_ID

- STANDBY_NAMENODE_ID

- HA_ZOOKEEPER_QUORUM

- YARN_ZK_DIR

- YARN_CLUSTER_ID

- YARN_RM1_IP

- YARN_RM2_IP

- YARN_JOBHISTORY_IP

###ENV included without hadoop HA

- NAMENDOE_IP

- RESOURCEMANAGER_IP

- HISTORYSERVER_IP

