#!/bin/sh

# ======================================
# (c) 2018 Adrian Newby
# ======================================


date > export-timing

NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export NLS_LANG

exp parfile=full-export.par

date >> export-timing
