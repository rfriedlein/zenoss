 
###########################################################################
#
# This program is part of Zenoss Core, an open source monitoring platform.
# Copyright (C) 2007, Zenoss Inc.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 as published by
# the Free Software Foundation.
#
# For complete information please visit: http://www.zenoss.com/oss/
#
###########################################################################

import Globals
import re
from Products.ZenReports import Utils, Utilization
from Products.ZenReports.AliasPlugin import AliasPlugin, Column, \
                                            PythonColumnHandler, \
                                            RRDColumnHandler
                                            
import logging
log = logging.getLogger('zen.TemPagerTempSensorPlugin')

class TemPagerTempSensorPlugin( AliasPlugin ):
    "The TemPagerTempSensor usage report"

    def getComponentPath(self):
        return 'sensors'
    
    def _getComponents(self, device, componentPath):
        components = device.getDeviceComponents(type='TemPagerTempSensor')
        log.error("_getComponents Components %s", components)
        return components
    
    def getColumns(self):
        return [
                Column('deviceName', PythonColumnHandler( 'device.titleOrId()' )),
                Column('TemPagerTempSensor', PythonColumnHandler( 'component.name()' )),
                Column('Temp', RRDColumnHandler( 'TemPagerTempSensor_C' )),
                ]
    
