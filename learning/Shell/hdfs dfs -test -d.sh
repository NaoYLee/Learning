#!/bin/bash
echo 'bigdata'
hdfs dfs -test -d /bigdata
# shellcheck disable=SC2181
if [ $? -eq 0 ]
then
    # shellcheck disable=SC2319
    status=$?
    echo 'yes'
    echo "$status"
else
    # shellcheck disable=SC2319
    status=$?
    echo 'no'
    echo "$status"
fi
hdfs dfs -test -d /bigdata
status=$?
if [ $status -eq 0 ]
then
    echo 'yes'
    echo "$status"
else
    echo 'no'
    echo "$status"
fi
echo 'user'
hdfs dfs -test -d /user
status=$?
if [ $status -eq 0 ]
then
    echo 'yes'
    echo "$status"
else
    echo 'no'
    echo "$status"
fi