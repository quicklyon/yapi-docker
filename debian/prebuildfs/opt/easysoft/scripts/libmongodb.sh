#!/bin/bash
#
# Easysoft mongodb server handler library

# shellcheck disable=SC1090,SC1091

# Load generic libraries
. /opt/easysoft/scripts/liblog.sh
. /opt/easysoft/scripts/libos.sh

########################
# Check and waiting MongoDB to be ready. 
# Globals:
#   MAXWAIT
#   MONGODB_HOST
#   MONGODB_PORT
# Arguments:
#   $1 - mongodb service host
#   $2 - mongodb service port
# Returns:
#   0 if the mongodb server is can be connected, 1 otherwise
#########################
wait_for_mongodb() {
    local retries=${MAXWAIT:-30}
    local mongodb_host="${1:-$MONGODB_HOST}"
    local mongodb_port="${2:-$MONGODB_PORT}"
    info "Check whether the MongoDB is available."

    for ((i = 1; i <= retries; i += 1)); do
        if wait-for-port --host="${mongodb_host}" --state=inuse --timeout=1 "${mongodb_port}" > /dev/null 2>&1;
        then
            info "MongoDB is ready."
            break
        fi

        warn "Waiting MongoDB $i seconds"

        if [ "$i" == "$retries" ]; then
            error "Unable to connect to MongoDB: $mongodb_host:$mongodb_port"
            return 1
        fi
    done
    return 0
}
