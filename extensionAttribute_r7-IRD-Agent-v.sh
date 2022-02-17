#!/bin/bash

# Report the version of the Rapid7 Agent if installed

# From Rapid7 Support:
# The agent has a bootstrap component that is running 1.2.x and this is the command and control for the agent, 
# it stops and starts the agent as well as updates it. The agent itself is the 2.7.x version, which is updated 
# more regularly for things like bug fixes and content patches and general improvements. 
# The bootstrap gets updated too but not as often.

if [ -e /opt/rapid7/ir_agent/ir_agent ]; then
    versionCheck=$(/opt/rapid7/ir_agent/components/insight_agent/insight_agent --version | awk '/Semantic/ {print $3}')
else
    versionCheck="Agent Not Installed"
fi
# Report the result to the JSS.
echo "<result>$versionCheck</result>"
