#!/bin/sh
Szeneventserver="/usr/local/zenoss/bin/zeneventserver start"
Szopectl="/usr/local/zenoss/bin/zopectl start"
Szenhub="/usr/local/zenoss/bin/zenhub start"
Szenjobs="/usr/local/zenoss/bin/zenjobs start"
Szeneventd="/usr/local/zenoss/bin/zeneventd start"
Szenping="/usr/local/zenoss/bin/zenping start"
Szensyslog="/usr/local/zenoss/bin/zensyslog start"
Szenstatus="/usr/local/zenoss/bin/zenstatus start"
Szenactiond="/usr/local/zenoss/bin/zenactiond start"
Szentrap="/usr/local/zenoss/bin/zentrap start"
Szenmodeler="/usr/local/zenoss/bin/zenmodeler start"
Szenperfsnmp="/usr/local/zenoss/bin/zenperfsnmpd start"
Szencommand="/usr/local/zenoss/bin/zencommand start"
Szenprocess="/usr/local/zenoss/bin/zenprocess start"
Szenrrdcached="/usr/local/zenoss/bin/zenrrdcached start"
Szenjmx="/usr/local/zenoss/bin/zenjmx start"
Szenpython="/usr/local/zenoss/bin/zenpython start"
Szencalcperfd="/usr/local/zenoss/bin/zencalcperfd start"
############## Get your log on ###############
LOGFILE="/var/log/zenoss/aliveornot.log"
############### Check zeneventserver ################
SERVICE='zeneventserver'
echo "" >> $LOGFILE
echo `date` >> $LOGFILE
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzeneventserver=`ps ax | grep -v grep | grep -c mysqld`
                if [ $checkzeneventserver -le 0 ]
                then
                        $Szeneventserver
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zopectl ################
SERVICE='zopectl'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzopectl=`ps ax | grep -v grep | grep -c zopectl`
                if [ $checkzopectl -le 0 ]
                then
                        $Szopectl
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenhub ####################
SERVICE='zenhub'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenhub=`ps ax | grep -v grep | grep -c zenhub`
                if [ $checkzenhub -le 0 ]
                then
                        $Szenhub
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenjobs ################
SERVICE='zenjobs'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenjobs=`ps ax | grep -v grep | grep -c zenjobs`
                if [ $checkzenjobs -le 0 ]
                then
                        $Szenjobs
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zeneventd ################
SERVICE='zeneventd'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzeneventd=`ps ax | grep -v grep | grep -c zeneventd`
                if [ $checkzeneventd -le 0 ]
                then
                        $Szeneventd
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenping ####################
SERVICE='zenping'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenping=`ps ax | grep -v grep | grep -c zenping`
                if [ $checkzenping -le 0 ]
                then
                        $Szenping
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zensyslog ################
SERVICE='zensyslog'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzensyslog=`ps ax | grep -v grep | grep -c zensyslog`
                if [ $checkzensyslog -le 0 ]
                then
                        $Szensyslog
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenstatus ################
SERVICE='zenstatus'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenstatus=`ps ax | grep -v grep | grep -c zenstatus`
                if [ $checkzenstatus -le 0 ]
                then
                        $Szenstatus
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenactiond ####################
SERVICE='zenactiond'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenactiond=`ps ax | grep -v grep | grep - zenactiond`
                if [ $checkzenactiond -le 0 ]
                then
                        $Szenactiond
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zentrap ################
SERVICE='zentrap'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzentrap=`ps ax | grep -v grep | grep -c zentrap`
                if [ $checkzentrap -le 0 ]
                then
                        $Szentrap
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenmodeler ################
SERVICE='zenmodeler'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenmodeler=`ps ax | grep -v grep | grep -c zenmodeler`
                if [ $checkzenmodeler -le 0 ]
                then
                        $Szenmodeler
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenperfsnmp ####################
SERVICE='zenperfsnmp'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenperfsnmp=`ps ax | grep -v grep | grep -c zenperfsnmp`
                if [ $checkzenperfsnmp -le 0 ]
                then
                        $Szenperfsnmp
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zencommand ################
SERVICE='zencommand'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzencommand=`ps ax | grep -v grep | grep -c zencommand`
                if [ $checkzencommand -le 0 ]
                then
                        $Szencommand
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenprocess ################
SERVICE='zenprocess'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenprocess=`ps ax | grep -v grep | grep -c zenprocess`
                if [ $checkzenprocess -le 0 ]
                then
                        $Szenprocess
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenrrdcached ####################
SERVICE='zenrrdcached'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenrrdcached=`ps ax | grep -v grep | grep -c zenrrdcached`
                if [ $checkzenrrdcached -le 0 ]
                then
                        $Szenrrdcached
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenjmx ################
SERVICE='zenjmx'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenjmx=`ps ax | grep -v grep | grep -c zenjmx`
                if [ $checkzenjmx -le 0 ]
                then
                        $Szenjmx
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zenpython ################
SERVICE='zenpython'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzenpython=`ps ax | grep -v grep | grep -c zenpython`
                if [ $checkzenpython -le 0 ]
                then
                        $Szenpython
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
############### Check zencalcperfd ####################
SERVICE='zencalcperfd'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is OK" >> $LOGFILE
else
    echo "$SERVICE is not running, restarting $SERVICE" >> $LOGFILE
        checkzencalcperfd=`ps ax | grep -v grep | grep -c zencalcperfd`
                if [ $checkzencalcperfd -le 0 ]
                then
                        $Szencalcperfd
                                if ps ax | grep -v grep | grep $SERVICE > /dev/null
                                then
                            echo "$SERVICE service is now restarted, everything is OK" >> $LOGFILE
                                fi
                fi
fi
exit 0
