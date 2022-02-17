#!/bin/sh

# Report the version of the Rapid7 Agent if installed
# ClientIDs can be found in https://insight.rapid7.com/platform#/datacollection

if [ -e /opt/rapid7/ir_agent/ir_agent ]; then
    clientID=$(grep -Eio '"Client-ID":.*?[^\\]"' /opt/rapid7/ir_agent/components/bootstrap/common/bootstrap.cfg | awk -F'[/:]' '{print $2}' | sed -e 's/[{"]/''/g')
else
    clientID="Agent Not Installed"
fi
# Report the result to the JSS.
echo "<result>$clientID</result>"
