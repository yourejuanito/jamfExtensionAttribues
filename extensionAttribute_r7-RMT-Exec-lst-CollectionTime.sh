#!/bin/sh

# Report the value of the Rapid7 Agent's "remote_execution_last_collection_time", which seems like a good proxy for when the client last checked for agent or metadata updates from Rapid7

if [ -e /opt/rapid7/ir_agent/ir_agent ]; then
    lastExecuted=$(date -r $(cat /opt/rapid7/ir_agent/components/insight_agent/common/config/agent.jobs.tem_realtime.json | awk '/remote_execution_last_collection_time/ {print$2}' | sed s/\,//g))
else
    lastExecuted="Agent Not Installed"
fi
# Report the result to the JSS.
echo "<result>$lastExecuted</result>"
