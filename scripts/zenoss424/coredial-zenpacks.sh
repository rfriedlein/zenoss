#!/bin/bash
#######################################################
# Version: 01                                         #
#######################################################

cd /home/zenoss
git clone https://github.com/rfriedlein/zenoss
sleep 1m
cp -R /home/zenoss/zenoss/ZenPacks/* /usr/local/zenoss/ZenPacks/.
chown -R zenoss:zenoss /usr/local/zenoss/ZenPacks
cd /home/zenoss/zenoss/ZenPacks
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
