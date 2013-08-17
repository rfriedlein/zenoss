#!/bin/bash            
#######################################################
# Version: 03 Stable                                 #
#  Status: Functional                                 # 
#   Notes: Updated code to stable level               #
#  Zenoss: Core 4.2.4 & ZenPacks                      #
#      OS: Ubuntu 12.04.2 x86_64                      #
#######################################################

# Script Logging Parameters
(

# Beginning Script Message
echo && echo "Welcome to the Zenoss 4.2.4 Coredial core-autodeploy script for Ubuntu!"
echo "https://github.com/rfriedlein/zenoss" && echo 
sleep 10

# Ubuntu Updates
apt-get update
apt-get -y dist-upgrade

# Script Compatibility with OS
if grep -Fxq "Ubuntu 12.04.2 LTS" /etc/issue.net
        then    echo "...Correct OS detected."
        else    echo "...Incorrect OS detected...stopping script" && exit 0
fi
if uname -m | grep -Fxq "x86_64"
        then    echo "...Correct Arch detected."
        else    echo "...Incorrect Arch detected...stopped script" && exit 0
fi
if [ `whoami` != 'zenoss' ];
        then    echo "...All system checks passed."
        else    echo "...This script should not be ran by the zenoss user" && exit 0
fi

# Install Package Dependencies
echo debconf shared/accepted-oracle-license-v1-1 select true | \
debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
debconf-set-selections
apt-get -y install python-software-properties
export DEBIAN_FRONTEND=noninteractive
apt-get -y install mysql-server mysql-client mysql-common
mysql -u root -e "show databases;" > /tmp/mysql.txt 2>> /tmp/mysql.txt
if grep -Fxq "Database" /tmp/mysql.txt
        then    echo "...MySQL connection test successful."
        else    echo "...Please ensure the MySQL root user password is blank for the Zenoss Core 4.2.4 Install." && exit 0
fi

# Setup Zenoss User, Build Environment, and Rabbit
cd /home/zenoss/zenoss424-srpm_install
. /home/zenoss/zenoss424-srpm_install/variables.sh
mkdir $ZENHOME
chown -R zenoss:zenoss $ZENHOME
rabbitmqctl add_user zenoss zenoss
rabbitmqctl add_vhost /zenoss
rabbitmqctl set_permissions -p /zenoss zenoss '.*' '.*' '.*'
chmod 777 /home/zenoss/.bashrc
echo 'export ZENHOME=/usr/local/zenoss' >> /home/zenoss/.bashrc
echo 'export PYTHONPATH=/usr/local/zenoss/lib/python' >> /home/zenoss/.bashrc
echo 'export PATH=/usr/local/zenoss/bin:$PATH' >> /home/zenoss/.bashrc
echo 'export INSTANCE_HOME=$ZENHOME' >> /home/zenoss/.bashrc
chmod 644 /home/zenoss/.bashrc
echo '#max_allowed_packet=16M' >> /etc/mysql/my.cnf
echo 'innodb_buffer_pool_size=256M' >> /etc/mysql/my.cnf
echo 'innodb_additional_mem_pool_size=20M' >> /etc/mysql/my.cnf
sed -i 's/mibs/#mibs/g' /etc/snmp/snmp.conf
echo "...It's safe to ignore the above rabbit warnings."

# Download Zenoss SRPM and extract it
if [ -f $INSTALLDIR/zenoss_core-4.2.4/GNUmakefile.in ];
        then    echo "...skipping SRPM download and extraction."
        else    cd $INSTALLDIR/
                echo "...This might take a few minutes."
                wget -N http://iweb.dl.sourceforge.net/project/zenoss/zenoss-4.2/zenoss-4.2.4/zenoss_core-4.2.4.el6.src.rpm
                rpm2cpio zenoss_core-4.2.4.el6.src.rpm | cpio -i --make-directories
                bunzip2 zenoss_core-4.2.4-1859.el6.x86_64.tar.bz2
                tar -xvf zenoss_core-4.2.4-1859.el6.x86_64.tar
                chown -R zenoss:zenoss $INSTALLDIR
fi

# Install Zenoss Core
tar zxvf $INSTALLDIR/zenoss_core-4.2.4/externallibs/rrdtool-1.4.7.tar.gz
cd rrdtool-1.4.7/
./configure --prefix=$ZENHOME
make
make install
cd $INSTALLDIR/zenoss_core-4.2.4/
wget -N http://dev.zenoss.org/svn/tags/zenoss-4.2.4/inst/rrdclean.sh
wget -N http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.3/rabbitmq-server_3.1.3-1_all.deb
dpkg -i rabbitmq-server_3.1.3-1_all.deb
./configure 2>&1 | tee log-configure.log
make 2>&1 | tee log-make.log
make clean 2>&1 | tee log-make_clean.log
cp mkzenossinstance.sh mkzenossinstance.sh.orig
su - root -c "sed -i 's:# configure to generate the uplevel mkzenossinstance.sh script.:# configure to generate the uplevel mkzenossinstance.sh script.\n#\n#Custom Ubuntu Variables\n. /home/zenoss/zenoss424-srpm_install/variables.sh:g' $INSTALLDIR/zenoss_core-4.2.4/mkzenossinstance.sh"
./mkzenossinstance.sh 2>&1 | tee log-mkzenossinstance_a.log
./mkzenossinstance.sh 2>&1 | tee log-mkzenossinstance_b.log
chown -R zenoss:zenoss $ZENHOME
echo "...It's safe to ignore the above pyraw,zensocket,nmap warnings."

# Install Zenoss Core Zenpacks
mkdir /usr/local/zenoss/ZenPacks
rm -fr /home/zenoss/rpm > /dev/null 2>/dev/null
rm -fr /home/zenoss/*.egg > /dev/null 2>/dev/null
mkdir /home/zenoss/rpm
cd /home/zenoss/rpm
wget -N http://superb-dca2.dl.sourceforge.net/project/zenoss/zenoss-4.2/zenoss-4.2.4/zenoss_core-4.2.4.el6.x86_64.rpm
rpm2cpio zenoss_core-4.2.4.el6.x86_64.rpm | sudo cpio -ivd ./opt/zenoss/packs/*.*
cp /home/zenoss/rpm/opt/zenoss/packs/*.egg /usr/local/zenoss/ZenPacks/.
cd /usr/local/zenoss/ZenPacks
wget -N "https://raw.github.com/rfriedlein/zenoss/blob/master/scripts/zenoss424/zenpack-helper.sh"
wget -N "https://raw.github.com/rfriedlein/zenoss/blob/master/scripts/zenoss424/coredial-zenpacks.sh"
chown zenoss:zenoss /usr/local/zenoss/ZenPacks/*.sh
chmod +x /usr/local/zenoss/ZenPacks/*.sh
su - zenoss -c "cd /usr/local/zenoss/ZenPacks && /bin/sh zenpack-helper.sh"
sleep 5m
su - zenoss -c "cd /usr/local/zenoss/ZenPacks && /bin/sh coredial-zenpacks.sh"
sleep 5m
easy_install readline

# Post Install Tweaks
cp $ZENHOME/bin/zenoss /etc/init.d/zenoss
touch $ZENHOME/var/Data.fs
chown zenoss:zenoss $ZENHOME/var/Data.fs
su - root -c "sed -i 's:# License.zenoss under the directory where your Zenoss product is installed.:# License.zenoss under the directory where your Zenoss product is installed.\n#\n#Custom Ubuntu Variables\nexport ZENHOME=$ZENHOME\nexport RRDCACHED=$ZENHOME/bin/rrdcached:g' /etc/init.d/zenoss"
update-rc.d zenoss defaults
chown root:zenoss $ZENHOME/bin/nmap
chmod u+s $ZENHOME/bin/nmap
chown root:zenoss $ZENHOME/bin/zensocket
chmod u+s $ZENHOME/bin/zensocket
chown root:zenoss $ZENHOME/bin/pyraw
chmod u+s $ZENHOME/bin/pyraw
echo 'watchdog True' >> $ZENHOME/etc/zenwinperf.conf
cp /home/zenoss/zenoss424-srpm_install/DataRoot.py /usr/local/zenoss/Products/ZenModel/
cp /home/zenoss/zenoss424-srpm_install/viewGraphReport.pt /usr/local/zenoss/Products/ZenModel/skins/zenmodel/
cp /home/zenoss/zenoss424-srpm_install/viewPerformanceDetail.pt /usr/local/zenoss/Products/ZenModel/skins/zenmodel/
chown -R zenoss:zenoss /usr/local/zenoss/Products/
cd /usr/local/zenoss/bin/
wget -N https://raw.github.com/hydruid/zenoss/master/core-autodeploy/4.2.4/misc/secure_zenoss_ubuntu.sh
wget -N https://raw.github.com/rfriedlein/zenoss/blob/master/scripts/zenoss424/zenoss-alive.sh
wget -N https://raw.github.com/rfriedlein/zenoss/blob/master/scripts/zenpack-remove.py
chown -R zenoss:zenoss $ZENHOME
chmod 0700 /usr/local/zenoss/bin/secure_zenoss_ubuntu.sh
chmod 0700 /usr/local/zenoss/bin/zenoss-alive.sh
chmod 0700 /usr/local/zenoss/bin/zenpack-remove.py
su -l -c /usr/local/zenoss/bin/secure_zenoss_ubuntu.sh

# End of Script Message
FINDIP=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
echo && echo "The Zenoss 4.2.4 Coredial core-autodeploy script for Ubuntu is complete!!!" && echo
echo "Browse to $FINDIP:8080 to access your new Zenoss install."
echo "The default login is:"
echo "  username: admin"
echo "  password: zenoss"
echo " Please change this!"

) 2>&1 | tee script-log.txt
