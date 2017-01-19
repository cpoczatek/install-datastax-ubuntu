#!/usr/bin/env bash
node_ip=$1
echo "Starting DataStax Studio"

echo "Update httpBindAddress"
file=$MESOS_SANDBOX/datastax-studio-1.0.2/conf/configuration.yaml

date=$(date +%F)
backup="$file.$date"
cp $file $backup

cat $file \
| sed -e "s:.*\(httpBindAddress\:\).*:httpBindAddress\: $node_ip:" \
> $file.new

mv $file.new $file
