##########################################################################
# Author:               Jane Curry,  jane.curry@skills-1st.co.uk
# Date:                 February 3rd, 2011
# Revised:
#
# BaytechPduOutlet object class
#
# This program can be used under the GNU General Public License version 2
# You can find full information here: http://www.zenoss.com/oss
#
##########################################################################

__doc__="""BaytechPduOutlet

BaytechPduOutlet is a component of a BaytechPduDevice Device

$Id: $"""

__version__ = "$Revision: $"[11:-2]

from Globals import DTMLFile
from Globals import InitializeClass

from Products.ZenRelations.RelSchema import *
from Products.ZenModel.ZenossSecurity import ZEN_VIEW, ZEN_CHANGE_SETTINGS

from Products.ZenModel.DeviceComponent import DeviceComponent
from Products.ZenModel.ManagedEntity import ManagedEntity

import logging
log = logging.getLogger('BaytechPduOutlet')

class BaytechPduOutlet(DeviceComponent, ManagedEntity):
    """Baytech PDU Outlet object"""

    portal_type = meta_type = 'BaytechPduOutlet'
    
    #**************Custom data Variables here from modeling************************
    
    outNumber = 0
    outName = ''
    outState = 'Unknown'
    outBank = 0
    
    #**************END CUSTOM VARIABLES *****************************
    
    
    #*************  Those should match this list below *******************
    _properties = (
        {'id':'outNumber', 'type':'int', 'mode':''},
        {'id':'outName', 'type':'string', 'mode':''},
        {'id':'outState', 'type':'string', 'mode':''},
        {'id':'outBank', 'type':'int', 'mode':''},
        )
    #****************
    
    _relations = (
        ("BaytechPduDevOut", ToOne(ToManyCont,
            "ZenPacks.ZenSystems.BaytechPdu.BaytechPduDevice", "BaytechPduOut")),
        )

    factory_type_information = ( 
        { 
            'id'             : 'BaytechPduOutlet',
            'meta_type'      : 'BaytechPduOutlet',
            'description'    : """Baytech PDU Outlet info""",
            'product'        : 'Baytech',
            'immediate_view' : 'viewBaytechPduOutlet',
            'actions'        :
            ( 
                { 'id'            : 'status'
                , 'name'          : 'Baytech PDU Outlet Graphs'
                , 'action'        : 'viewBaytechPduOutlet'
                , 'permissions'   : (ZEN_VIEW, )
                },
                { 'id'            : 'perfConf'
                , 'name'          : 'Baytech PDU Outlet Template'
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
        return str( self.outNumber ) + "-" + self.outName


    # use viewName as titleOrId because that method is used to display a human
    # readable version of the object in the breadcrumbs
    titleOrId = name = viewName


    def device(self):
        return self.BaytechPduDevOut()
    
    def monitored(self):
        """
        Dummy
        """
        return True
        
InitializeClass(BaytechPduOutlet)
