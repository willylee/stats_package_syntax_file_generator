#! /bin/bash

# This file is part of the Minnesota Population Center's stats_package_syntax_file_generator project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also on-line at:
#   https://github.com/mnpopcenter/stats_package_syntax_file_generator

# A script used in end-to-end acceptance testing.
# Compares a set of expected syntax files to syntax files
# generated by running the syntax file utility.

DIR=`dirname $0`

if   [ "$*" = "cmp" ]; then
    CMD='cmp'
elif [ "$*" = "diff" ]; then
    CMD='diff'
else
    echo "Usage: $0 cmp|diff"
    exit
fi

EXPECT="${DIR}/output_expected"
RESULT="${DIR}/output_result"

for F in ${EXPECT}/*.*
do
    F=`basename ${F}`
    ${CMD} ${EXPECT}/${F} ${RESULT}/${F}
done
