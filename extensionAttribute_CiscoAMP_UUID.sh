#!/bin/bash

# Reports the Current UUID Associated to the device in the Cisco AMP Console
#
# this has been created in order to display UUID in the inventory portion of the jamf server in order to 
# troubleshoot or identify issues with the Cyberscurity team and the service in order to identfy macOS Devices
#


if [ -e /opt/cisco/amp ]; then
    UUID=$(sed -n 's:.*<uuid>\(.*\)</uuid>.*:\1:p' "/Library/Application Support/Cisco/AMP for Endpoints Connector/local.xml")
else
    UUID="Cisco AMP Not Installed"
fi
# Report the result to the JSS.
echo "<result>$UUID</result>"
