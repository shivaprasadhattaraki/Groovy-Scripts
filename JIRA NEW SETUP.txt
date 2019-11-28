JIRA SETUP 7.13.0 to  8.2.1
	




1)	Install jira software as service.

2)	Install postgresql
        
	COMMANDS

This is for if psql should install in same Jira server otherwise if you are using dataendpoint use pgadmin tool to create Database

    1) Use collation "C" instead of UTF-8 as Jira 8.O does not support UTF-8 Collation.



(rpm -Uvh http://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm

yum install postgresql96-server postgresql96

/usr/pgsql-9.6/bin/postgresql96-setup initdb

systemctl start postgresql-9.6
systemctl enable postgresql-9.6

su - postgres)

3)		Create DAtabase and user with password


		CREATE USER rndjirastg WITH ENCRYPTED PASSWORD 'rndjirastg';

		CREATE DATABASE rndjirastgdb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;

		GRANT ALL PRIVILEGES ON DATABASE rndjirastgdb TO rndjirastg

		\du  \l

		Show hba file:

		pg_hba.conf  Change IPV4 configurations  change ident and peer to trust or md5

4) start jira with ipaddress and 8080 port connect with database.
   

5) shutdown jira

 Change JVM in setenv.sh and increase JVM Memory.

 a) Alter Database with following command

     ALTER TABLE os_historystep ALTER COLUMN caller TYPE character varying(255);


6) place attachments, avatars and Backup files to their corresponding directories

7) give executable permissions to files, ex: chmod 755 attachments

8) Chown -R jira:jira attachments avatars Jirabackup-7.13.0.-18-03-2019.zip files.

9) Restart jira and import data.

   9b) use admin password recovery step to login jira.or create one admin user in internal directory of Production jira and take backup.

10) Check integrity checker.

11) 7.13.0 to 7.13.5 ---> 8.0.3---> 8.2.1
12) JSD 3.6 to 4.2.1
13) update ADD-ons
                     SSL/HTTPS
14) shutdown jira and edit server.xml file and add {proxyname="padijirastg.metricstream.com" scheme="https" proxyport="443/>}

15) Do desired changes in /etc/httpd/jirassl.conf
16) Restart httpd service as  systemctl restart httpd
17) Access Jira with https url.


If any Product not found error

	start jira with Root user
	Stop jira

	Delete .osgi .bundled plugins

	Delete contents of work directory in jira-install

        Restart Jira.

