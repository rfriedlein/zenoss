##########################################################################
# Author:               rfriedlein,  rfriedlein@coredial.com
# Date:                 February 4th, 2011
# Revised:		Feb 11th, 2011
#			Make power supply a standalone, single-instance component
#
# BaytechPduPS object class
#
# This program can be used under the GNU General Public License version 2
# You can find full information here: http://www.zenoss.com/oss
#
##########################################################################

__doc__="""BaytechPduPS

BaytechPduPS is a component of a BaytechPduDevice Device

$Id: $"""

__version__ = "$Revision: $"[11:-2]

from Globals import DTMLFile
from Globals import InitializeClass

from Products.ZenRelations.RelSchema import *
from Products.ZenModel.ZenossSecurity import ZEN_VIEW, ZEN_CHANGE_SETTINGS

from Products.ZenModel.DeviceComponent import DeviceComponent
from Products.ZenModel.ManagedEntity import ManagedEntity

import logging
log = logging.getLogger('BaytechPduPS')

class BaytechPduPS(DeviceComponent, ManagedEntity):
    """Baytech PDU PS object"""

    portal_type = meta_type = 'BaytechPduPS'
    
    #**************Custom data Variables here from modeling************************
    
    supply1Status = ''
    supply2Status = ''
    
    #**************END CUSTOM VARIABLES *****************************
    
    
    #*************  Those should match this list below *******************
    _properties = (
        {'id':'supply1Status', 'type':'string', 'mode':''},
        {'id':'supply2Status', 'type':'string', 'mode':''},
        )
    #****************
    
    _relations = (
        ("BaytechPduDevP", ToOne(ToManyCont,
            "ZenPacks.ZenSystems.Baytech.BaytechPduDevice", "BaytechPduP")),
        )

    factory_type_information = ( 
        { 
            'id'             : 'BaytechPduPS',
            'meta_type'      : 'BaytechPduPS',
            'description'    : """Baytech PDU PS info""",
            'product'        : 'Baytech',
            'immediate_view' : 'viewBaytechPduPS',
            'actions'        :
            ( 
                { 'id'            : 'status'
                , 'name'          : 'Baytech PDU PS Graphs'
                , 'action'        : 'viewBaytechPduPS'
                , 'permissions'   : (ZEN_VIEW, )
                },
                { 'id'            : 'perfConf'
                , 'name'          : 'Baytech PDU PS Template'
                , 'action'        : 'objTemplates'
                , 'permissions'   : (ZEN_CHANGE_SETTINGS, )
                },                
                { 'id'            : 'viewHistory'
                , 'name'          : 'Modifications'
                , 'action'        : 'viewHistory'
                , 'permissions'   : (ZEN_VIEW, )
                },
            )
          },
        ) 

    isUserCreatedFlag = True

    def isUserCreated(self):
        """
        Returns the value of isUserCreated. True adds SAVE & CANCEL buttons to Details menu
        """
        return self.isUserCreatedFlag

    def viewName(self):
        """Pretty version human readable version of this object"""
        return self.id


    # use viewName as titleOrId because that method is used to display a human
    # readable version of the object in the breadcrumbs
    titleOrId = name = viewName


    def device(self):
        return self.BaytechPduDevP()
    
    def monitored(self):
        """
        Dummy
        """
        return True
        
InitializeClass(BaytechPduPS)
