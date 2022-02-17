#!/bin/sh

# Report the value of the Rapid7 Agent's "asset_info_last_collection_time", which seems like a good proxy for client-to-server heartbeat

if [ -e /opt/rapid7/ir_agent/ir_agent ]; then
    lastCollected=$(date -r $(cat /opt/rapid7/ir_agent/components/insight_agent/common/config/agent.jobs.tem_realtime.json | awk '/asset_info_last_collection_time/ {print$2}' | sed s/\,//g))
else
    lastCollected="Agent Not Installed"
fi
# Report the result to the JSS.
echo "<result>$lastCollected</result>"
