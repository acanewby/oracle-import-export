#!/bin/sh

# ======================================
# (c) 2018 Adrian Newby
# ======================================



date > import-timing

NLS_LANG=AMERICAN_AMERICA.AL32UTF8
export NLS_LANG

imp parfile=full-import.par

date >> import-timing


