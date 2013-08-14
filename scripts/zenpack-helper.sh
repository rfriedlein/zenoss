#!/bin/bash
#######################################################
# Version: 01c                                        #
#######################################################

ZENHOME=/usr/local/zenoss
export ZENHOME=/usr/local/zenoss
PYTHONPATH=/usr/local/zenoss/lib/python
PATH=/usr/local/zenoss/bin:$PATH
INSTANCE_HOME=$ZENHOME
wget "http://wiki.zenoss.org/download/zenpacks/ZenPacks.zenoss.AWS/2.0.0/ZenPacks.zenoss.AWS-2.0.0.egg"
git clone git://github.com/epuzanov/ZenPacks.community.CiscoEnvMon.git
git clone git://github.com/Darkemon/ZenPacks.Darkemon.ZenCustomMap.git
git clone git://github.com/zenoss/ZenPacks.zenoss.CalculatedPerformance.git
git clone git://github.com/Hackman238/ZenPacks.Rackspace.LinuxMonitor.git
git clone git://github.com/zenoss/ZenPacks.community.DellSNMPTransforms.git
git clone git://github.com/epuzanov/ZenPacks.community.deviceAdvDetail.git
git clone git://github.com/epuzanov/ZenPacks.community.DellMon.git
git clone git://github.com/zenoss/ZenPacks.Nova.Cisco.Catalyst.git
git clone git://github.com/zenoss/ZenPacks.Iwillfearnoevil.Domain.git
git clone git://github.com/zenoss/ZenPacks.SCC.ShowGraphPortlet.git
git clone git://github.com/Hackman238/ZenPacks.SteelHouseLabs.EnhancedEthernetCsmacd.git
git clone git://github.com/jcurry/ZenPacks.ZenSystems.ApcPdu.git
sleep 1m
/usr/local/zenoss/bin/zenoss start
zenpack --install ZenPacks.zenoss.PySamba-1.0.2-py2.7-linux-x86_64.egg
zenpack --install ZenPacks.zenoss.ApacheMonitor-2.1.3-py2.7.egg
zenpack --install ZenPacks.zenoss.DellMonitor-2.2.0-py2.7.egg
zenpack --install ZenPacks.zenoss.DeviceSearch-1.2.0-py2.7.egg
zenpack --install ZenPacks.zenoss.DigMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.DnsMonitor-2.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.EsxTop-1.1.0-py2.7.egg
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
zenpack --install ZenPacks.zenoss.PythonCollector-1.0.1-py2.7.egg
zenpack --install ZenPacks.zenoss.WBEM-1.0.0-py2.7.egg
zenpack --install ZenPacks.zenoss.XenMonitor-1.1.0-py2.7.egg
zenpack --install ZenPacks.zenoss.ZenJMX-3.9.5-py2.7.egg
zenpack --install ZenPacks.zenoss.ZenossVirtualHostMonitor-2.4.0-py2.7.egg
zenpack --install ZenPacks.zenoss.AWS-2.0.0.egg
zenpack --link --install ZenPacks.Coredial.Asterisk14
zenpack --link --install ZenPacks.Coredial.Asterisk18
zenpack --link --install ZenPacks.Coredial.Baytech
zenpack --link --install ZenPacks.Coredial.EdgeView
zenpack --link --install ZenPacks.Coredial.fping
zenpack --link --install ZenPacks.Coredial.UDP
zenpack --link --install ZenPacks.Coredial.Opensips
zenpack --link --install ZenPacks.community.CiscoEnvMon
zenpack --link --install ZenPacks.Darkemon.ZenCustomMap
zenpack --link --install ZenPacks.zenoss.CalculatedPerformance
zenpack --link --install ZenPacks.Rackspace.LinuxMonitor
zenpack --link --install ZenPacks.community.DellSNMPTransforms
zenpack --link --install ZenPacks.community.deviceAdvDetail
zenpack --link --install ZenPacks.community.DellMon
zenpack --link --install ZenPacks.Nova.Cisco.Catalyst
zenpack --link --install ZenPacks.Iwillfearnoevil.Domain
zenpack --link --install ZenPacks.SCC.ShowGraphPortlet
zenpack --link --install ZenPacks.SteelHouseLabs.EnhancedEthernetCsmacd
zenpack --link --install ZenPacks.ZenSystems.ApcPdu
/usr/local/zenoss/bin/zenoss restart
