##########################################################################
# Author:               Jane Curry,  jane.curry@skills-1st.co.uk
# Date:                 February 3rd, 2011
# Revised:
#
# BaytechPduDevice modler plugin
#
# This program can be used under the GNU General Public License version 2
# You can find full information here: http://www.zenoss.com/oss
#
##########################################################################

__doc__ = """BaytechPduDeviceMap

Gather information from Baytech PDU devices.
"""

from Products.DataCollector.plugins.CollectorPlugin import SnmpPlugin, GetMap
from Products.DataCollector.plugins.DataMaps import MultiArgs
import re

class BaytechPduDeviceMap(SnmpPlugin):
    maptype = "BaytechPduDeviceMap"

    snmpGetMap = GetMap({
        '.1.3.6.1.4.1.4779.1.3.5.2.1.3': '_modelNumber',
        '.1.3.6.1.4.1.4779.1.1.1': '_hardwareRev',
        '.1.3.6.1.4.1.4779.1.3.5.2.1.2': 'setOSProductKey',
        '.1.3.6.1.4.1.4779.1.1.2': 'setHWSerialNumber',
         })

    def condition(self, device, log):
        """only for boxes with proper object id
        """
        return device.snmpOid.startswith(".1.3.6.1.4.1.4779.1.3.5.2")


    def process(self, device, results, log):
        """collect snmp information from this device"""
        log.info('processing %s for device %s', self.name(), device.id)
        getdata, tabledata = results
        if not getdata:
            log.warn(' No SNMP response from %s for the %s plugin ' % ( device.id, self.name() ) )
            return

        om = self.objectMap(getdata)
        try:
            manufacturer = "Baytech"
            om.setHWProductKey = om._modelNumber + ' ' + om._hardwareRev
            om.setHWProductKey = MultiArgs(om.setHWProductKey, manufacturer)
#            log.debug("HWProductKey=%s Manufacturer = %s" % (om.setHWProductKey, manufacturer))
            om.setOSProductKey = MultiArgs(om.setOSProductKey, manufacturer)
#            log.debug("OSProductKey=%s Manufacturer = %s" % (om.setOSProductKey, manufacturer))
        except (KeyError, IndexError, AttributeError, TypeError), errorInfo:
            log.warn( ' Attribute error in BaytechPduDeviceMap modeler plugin %s', errorInfo)


        return om

