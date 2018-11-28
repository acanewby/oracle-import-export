#!/bin/sh

# ======================================
# (c) 2018 Adrian Newby
# ======================================


ORACLE_SID=$1
export ORACLE_SID
cd /opt/oracle/admin/${ORACLE_SID}/scripts/import-export

ST_TIME=`date +%Y%m%d-%H%M%S`
date > export-timing

NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export NLS_LANG


ORACLE_HOME=`cat /etc/oratab | grep $ORACLE_SID | awk 'BEGIN { FS = ":" } ; { print $2 }'`
export ORACLE_HOME

if [ -z "$ORACLE_HOME" ]; then
        echo "Could not locate Oracle home directory for database: $ORACLE_SID"
        echo ""
        exit
fi

export PATH=$ORACLE_HOME/bin:/home/oracle/bin:$PATH

echo "Path: $PATH"
echo "Dir : `pwd`"
echo "SID : $ORACLE_SID"

expdp parfile=full-dp-export.par

date >> export-timing

# Archive the backup
DATA_PUMP_DIR=/dpumps/$ORACLE_SID
tar -cf $DATA_PUMP_DIR/full-dpexport-$ST_TIME.tar $DATA_PUMP_DIR/full-export*
gzip $DATA_PUMP_DIR/full-dpexport-$ST_TIME.tar

