##########################################################################
# Author:               rfriedlein,  rfriedlein@coredial.com
# Date:                 February 3rd, 2011
# Revised:
#
# BaytechPduDevice object class
#
# This program can be used under the GNU General Public License version 2
# You can find full information here: http://www.zenoss.com/oss
#
##########################################################################

from Globals import InitializeClass
from Products.ZenRelations.RelSchema import *
from Products.ZenModel.Device import Device
from Products.ZenModel.ZenossSecurity import ZEN_VIEW
from copy import deepcopy


class BaytechPduDevice(Device):
    "An Baytech PDU Device"

    _relations = Device._relations + (
        ('BaytechPduOut', ToManyCont(ToOne, 'ZenPacks.Coredial.Baytech.BaytechPduOutlet', 'BaytechPduDevOut')),
        ('BaytechPduBan', ToManyCont(ToOne, 'ZenPacks.Coredial.Baytech.BaytechPduBank', 'BaytechPduDevBan')),
        ('BaytechPduP', ToManyCont(ToOne, 'ZenPacks.Coreidal.BaytechPduPS', 'BaytechPduDevP')),
        )

    factory_type_information = deepcopy(Device.factory_type_information)

    def __init__(self, *args, **kw):
        Device.__init__(self, *args, **kw)
        self.buildRelations()


InitializeClass(BaytechPduDevice)
