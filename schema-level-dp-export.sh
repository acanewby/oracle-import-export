#!/bin/sh

# ======================================
# (c) 2018 Adrian Newby
# ======================================

SCHEMA=$1

NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export NLS_LANG

expdp SCHEMAS=$SCHEMA DUMPFILE=$SCHEMA-schema-export_%U.dpump LOGFILE=$SCHEMA-schema-export.dpump.log parfile=schema-level-dp-export.par


