#!/bin/bash
#######################################################
# Version: 01c                                        #
#######################################################

ZENHOME=/usr/local/zenoss
export ZENHOME=/usr/local/zenoss
PYTHONPATH=/usr/local/zenoss/lib/python
PATH=/usr/local/zenoss/bin:$PATH
INSTANCE_HOME=$ZENHOME
/usr/local/zenoss/bin/zenoss start
zenpack --install ZenPacks.zenoss.ZenossVirtualHostMonitor-2.4.0-py2.7.egg
zenpack --install ZenPacks.zenoss.PythonCollector-1.0.1-py2.7.egg
zenpack --install ZenPacks.zenoss.ApacheMonitor-2.1.3-py2.7.egg
zenpack --install ZenPacks.zenoss.DellMonitor-2.2.0-py2.7.egg
zenpack --install ZenPacks.zenoss.DeviceSearch-1.2.0-py2.7.egg
zenpack --install ZenPacks.zenoss.DigMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.DnsMonitor-2.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.FtpMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.HPMonitor-2.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.HttpMonitor-2.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.IRCDMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.JabberMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.LDAPMonitor-1.4.0-py2.7.egg
zenpack --install ZenPacks.zenoss.LinuxMonitor-1.2.1-py2.7.egg
zenpack --install ZenPacks.zenoss.MySqlMonitor-2.2.0-py2.7.egg
zenpack --install ZenPacks.zenoss.NNTPMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.NtpMonitor-2.2.0-py2.7.egg
zenpack --install ZenPacks.zenoss.WBEM-1.0.0-py2.7.egg
zenpack --install ZenPacks.zenoss.XenMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.ZenJMX-3.9.5-py2.7.egg
zenpack --install ZenPacks.zenoss.AWS-2.0.0.egg
zenpack --install ZenPacks.zenoss.EsxTop-1.1.0-py2.7.egg
/usr/local/zenoss/bin/zenoss restart
