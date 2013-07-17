##########################################################################
# Author:               rfriedlein,  rfriedlein@coredial.com
# Date:                 June 4th, 2013
# Revised:
#
# info.py for Baytech ZenPack
#
# This program can be used under the GNU General Public License version 2
# You can find full information here: http://www.zenoss.com/oss
#
################################################################################

__doc__="""info.py

Representation of Baytech components.

$Id: info.py,v 1.2 2010/12/14 20:45:46 jc Exp $"""

__version__ = "$Revision: 1.4 $"[11:-2]

from zope.interface import implements
from Products.Zuul.infos import ProxyProperty
from Products.Zuul.infos.component import ComponentInfo
from Products.Zuul.decorators import info
from ZenPacks.Coredial.Baytech import interfaces


class BaytechPduOutletInfo(ComponentInfo):
    implements(interfaces.IBaytechPduOutletInfo)

    outNumber = ProxyProperty("outNumber")
    outName = ProxyProperty("outName")
    outState = ProxyProperty("outState")
    outBank = ProxyProperty("outBank")

class BaytechPduBankInfo(ComponentInfo):
    implements(interfaces.IBaytechPduBankInfo)

    bankNumber = ProxyProperty("bankNumber")
    bankState = ProxyProperty("bankState")
    bankStateText = ProxyProperty("bankStateText")

class BaytechPduPSInfo(ComponentInfo):
    implements(interfaces.IBaytechPduPSInfo)

    supply1Status = ProxyProperty("supply1Status")
    supply2Status = ProxyProperty("supply2Status")



