# Docker 개발 환경

1. mysql
2. redis
3. php
4. python

## /etc/hosts 설정

- [www.codeigniter.co](web/nginx/etc/nginx/sites-enabled/www.codeigniter.co.conf)
- [www.laravel-.co](web/nginx/etc/nginx/sites-enabled/www.laravel.co.conf)

```shell
127.0.0.1 www.codeigniter.co:8080
127.0.0.1 www.laravel.co:8080
```

## symbolic link

```shellsss
ln -s ~/your/workspace/enwn00/codeigniter web/doc_root/www.codeigniter.co
ln -s ~/your/workspace/enwn00/laravel web/doc_root/www.laravel.co
```


## docker 설정

1. docker install [here](https://www.docker.com/)

2. docker network 을 만든다.

   ```shell
   sh scripts/setup-network.sh
   ```

3. docker-compose up (-d는 데몬을 의미)

   ```shell
   docker-compose up -d
   ```
4. docker ps 확인

   ```shell
   docker ps -a
   CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                                         NAMES
   2551ecc06cc4   docker_mysql-slave    "docker-entrypoint.s…"   4 minutes ago   Up 3 minutes   0.0.0.0:33070->3306/tcp, :::33070->3306/tcp   project-docker_mysql-slave
   401b3c35f16c   redis:5.0.8           "docker-entrypoint.s…"   4 minutes ago   Up 3 minutes   0.0.0.0:6479->6379/tcp, :::6479->6379/tcp     project-docker-redis-slave
   05b80c1051f7   docker_mysql-master   "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   0.0.0.0:33060->3306/tcp, :::33060->3306/tcp   project-docker_mysql-master
   1ca137412b63   redis:5.0.8           "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp     project-docker-redis-master
   ```

5. mysql replication 동기화 확인

   1. master status (root 패스워드 1234)

      ```shell
      docker exec -it 05b80c1051f7 bash -c "mysql -uroot -p"
      ```

      ```shell
      MariaDB [(none)]> show master status;
      +------------------+----------+--------------+------------------+
      | File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
      +------------------+----------+--------------+------------------+
      | mysql-bin.000003 |      342 |              |                  |
      +------------------+----------+--------------+------------------+
      1 row in set (0.000 sec)
      ```

   1. slave status (root 패스워드 1234)

      ```shell
      docker exec -it 2551ecc06cc4 bash -c "mysql -uroot -p"
      ```

      ```shell
      MariaDB [(none)]> show slave status;
      +----------------------------------+--------------+-------------+-------------+---------------+------------------+---------------------+-------------------------+---------------+-----------------------+------------------+-------------------+-----------------+---------------------+--------------------+------------------------+-------------------------+-----------------------------+------------+------------+--------------+---------------------+-----------------+-----------------+----------------+---------------+--------------------+--------------------+--------------------+-----------------+-------------------+----------------+-----------------------+-------------------------------+---------------+---------------+----------------+----------------+-----------------------------+------------------+----------------+--------------------+------------+-------------+-------------------------+-----------------------------+---------------+-----------+---------------------+-----------------------------------------------------------------------------+------------------+--------------------------------+----------------------------+
      | Slave_IO_State                   | Master_Host  | Master_User | Master_Port | Connect_Retry | Master_Log_File  | Read_Master_Log_Pos | Relay_Log_File          | Relay_Log_Pos | Relay_Master_Log_File | Slave_IO_Running | Slave_SQL_Running | Replicate_Do_DB | Replicate_Ignore_DB | Replicate_Do_Table | Replicate_Ignore_Table | Replicate_Wild_Do_Table | Replicate_Wild_Ignore_Table | Last_Errno | Last_Error | Skip_Counter | Exec_Master_Log_Pos | Relay_Log_Space | Until_Condition | Until_Log_File | Until_Log_Pos | Master_SSL_Allowed | Master_SSL_CA_File | Master_SSL_CA_Path | Master_SSL_Cert | Master_SSL_Cipher | Master_SSL_Key | Seconds_Behind_Master | Master_SSL_Verify_Server_Cert | Last_IO_Errno | Last_IO_Error | Last_SQL_Errno | Last_SQL_Error | Replicate_Ignore_Server_Ids | Master_Server_Id | Master_SSL_Crl | Master_SSL_Crlpath | Using_Gtid | Gtid_IO_Pos | Replicate_Do_Domain_Ids | Replicate_Ignore_Domain_Ids | Parallel_Mode | SQL_Delay | SQL_Remaining_Delay | Slave_SQL_Running_State                                                     | Slave_DDL_Groups | Slave_Non_Transactional_Groups | Slave_Transactional_Groups |
      +----------------------------------+--------------+-------------+-------------+---------------+------------------+---------------------+-------------------------+---------------+-----------------------+------------------+-------------------+-----------------+---------------------+--------------------+------------------------+-------------------------+-----------------------------+------------+------------+--------------+---------------------+-----------------+-----------------+----------------+---------------+--------------------+--------------------+--------------------+-----------------+-------------------+----------------+-----------------------+-------------------------------+---------------+---------------+----------------+----------------+-----------------------------+------------------+----------------+--------------------+------------+-------------+-------------------------+-----------------------------+---------------+-----------+---------------------+-----------------------------------------------------------------------------+------------------+--------------------------------+----------------------------+
      | Waiting for master to send event | mysql-master | repl_user   |        3306 |            60 | mysql-bin.000003 |                 342 | mysqld-relay-bin.000003 |           555 | mysql-bin.000003      | Yes              | Yes               | mysql           |                     |                    |                        |                         |                             |          0 |            |            0 |                 342 |             865 | None            |                |             0 | No                 |                    |                    |                 |                   |                |                     0 | No                            |             0 |               |              0 |                |                             |                1 |                |                    | No         |             |                         |                             | conservative  |         0 |                NULL | Slave has read all relay log; waiting for the slave I/O thread to update it |                0 |                              0 |                          0 |
      +----------------------------------+--------------+-------------+-------------+---------------+------------------+---------------------+-------------------------+---------------+-----------------------+------------------+-------------------+-----------------+---------------------+--------------------+------------------------+-------------------------+-----------------------------+------------+------------+--------------+---------------------+-----------------+-----------------+----------------+---------------+--------------------+--------------------+--------------------+-----------------+-------------------+----------------+-----------------------+-------------------------------+---------------+---------------+----------------+----------------+-----------------------------+------------------+----------------+--------------------+------------+-------------+-------------------------+-----------------------------+---------------+-----------+---------------------+-----------------------------------------------------------------------------+------------------+--------------------------------+----------------------------+
      1 row in set (0.000 sec)
      ```

      다음의 4개 값을 확인하면 된다. 
      - Master_Log_File : show master status 에서 확인한 File과 일치해야 한다.
      - Read_Master_Log_Pos : show master status 에서 확인한 Position과 일치해야 한다.
      - Slave_IO_Running : Yes
      - Slave_SQL_Running : Yes

1. redis replication 동기화 확인

   1. master info (root 패스워드 1234)

      ```shell
      docker exec -it 1ca137412b63 bash -c "redis-cli"
      ```

      ```shell
      127.0.0.1:6379> auth q8m2zEMbqaEy
      OK
      127.0.0.1:6379> info
      # Replication
      role:master
      connected_slaves:1
      slave0:ip=10.255.0.4,port=6379,state=online,offset=665,lag=1
      master_replid:bffae715f77eff04f171ba894bea66f79db0d21f
      master_replid2:0000000000000000000000000000000000000000
      master_repl_offset:665
      second_repl_offset:-1
      repl_backlog_active:1
      repl_backlog_size:1048576
      repl_backlog_first_byte_offset:1
      repl_backlog_histlen:665
      ```

   1. slave info (root 패스워드 1234)

      ```shell
      docker exec -it 401b3c35f16c bash -c "redis-cli"
      ```

      ```shell
      127.0.0.1:6379> auth q8m2zEMbqaEy
      OK
      127.0.0.1:6379> info
      # Replication
      role:slave
      master_host:redis-master
      master_port:6379
      master_link_status:up
      master_last_io_seconds_ago:8
      master_sync_in_progress:0
      slave_repl_offset:861
      slave_priority:100
      slave_read_only:1
      connected_slaves:0
      master_replid:bffae715f77eff04f171ba894bea66f79db0d21f
      master_replid2:0000000000000000000000000000000000000000
      master_repl_offset:861
      second_repl_offset:-1
      repl_backlog_active:1
      repl_backlog_size:1048576
      repl_backlog_first_byte_offset:1
      repl_backlog_histlen:861
      ```

## utility
