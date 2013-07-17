##########################################################################
# Author:               Jane Curry,  jane.curry@skills-1st.co.uk
# Date:                 February 3rd, 2011
# Revised:		Feb 11th, 2011
#			Collect single instance power supply info
#			and set snmpindex to 0
#
# BaytechPduPS modler plugin
#
# This program can be used under the GNU General Public License version 2
# You can find full information here: http://www.zenoss.com/oss
#
##########################################################################

__doc__ = """BaytechPduPSMap

Gather table information from Baytech PDU devices power supplies.
"""

from Products.DataCollector.plugins.CollectorPlugin import SnmpPlugin, GetMap, GetTableMap

class BaytechPduPSMap(SnmpPlugin):
    """Map Baytech PDU power supply data to model. These are scalars not table."""
    maptype = "BaytechPduPSMap"
    modname = "ZenPacks.ZenSystems.BaytechPdu.BaytechPduPS"
    relname = "BaytechPduP"
    compname = ""

    snmpGetMap = GetMap({
                    '.1.3.6.1.4.1.4779.1.3.5.3.1.3.1.1'	: 'supply1Status',
                    '.1.3.6.1.4.1.4779.1.3.5.3.1.3.1.2'	: 'supply2Status',
                    })

    def process(self, device, results, log):
        """collect snmp information from this device"""
        log.info('processing %s for device %s', self.name(), device.id)
        getdata, tabledata = results
        if not getdata:
            log.warn(' No SNMP response from %s for the %s plugin ' % ( device.id, self.name() ) )
            return
        rm = self.relMap()
        om = self.objectMap(getdata)
        if not om.supply1Status and not om.supply2Status:
            log.warn(' No SNMP values for BaytechPdu power supplies - component will not be created ' )
            return

        try:
            if int(om.supply1Status == 1):
                om.supply1Status = 'OK'
            elif int(om.supply1Status == 2):
                om.supply1Status = 'Failed'
            else:
                om.supply1Status = 'Unknown'

            if int(om.supply2Status == 1):
                om.supply2Status = 'OK'
            elif int(om.supply2Status == 2):
                om.supply2Status = 'Failed'
            else:
                om.supply2Status = 'Unknown'
            om.id = "Power_Supplies"
            om.id = self.prepId(om.id)
# Fix om.snmpindex to 0 as this is a scalar
            om.snmpindex = '0'
        except (KeyError, IndexError, AttributeError, TypeError), errorInfo:
            log.warn( ' Error in BaytechPduPSMap modeler plugin %s', errorInfo)

        rm.append(om)
        return rm


