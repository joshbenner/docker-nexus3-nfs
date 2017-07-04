#!/bin/bash

NFSTYPE=${NFSTYPE:-nfs4}
if [[ ! -z "${NFS}" ]]; then
  echo "Mounting via $NFSTYPE: $NFS -> /nexus-data"
  mount -t $NFSTYPE $NFS /nexus-data
  sudo -u nexus mkdir -p /nexus-data/etc /nexus-data/log /nexus-data/tmp
fi

if [ $# -eq 0 ]; then
  command="bin/nexus run"
else
  command="$@"
fi

exec sudo -u nexus $command
