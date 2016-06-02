#!/bin/sh
echo Author krishan thisera @iPhonik.com

if [ "$#" != 3 ]
then
echo
echo "Usage $0 <Where to export:ServerIP> <What should export:Exporting Dirctory> <Set permission>"
echo "Please reffer : https://github.com/krishanthisera/Share-A-Directory-between-two-server-NFS"
echo
exit 1
fi

ipaddr=$1
dir=$2
opt=$3
echo "Checking nfs-utils"
if ! rpm -qa | grep -qw nfs-utils; then
echo "Installing nfs-utils"
yum install nfs-utils
else
echo "nfs-utils Installed. Nothing to DO"
fi

echo "Checking nfs-utils-lib"
if ! rpm -qa | grep -qw nfs-utils-lib; then
echo "Installing nfs-utils"
yum install nfs-utils-lib
else
echo "nfs-utils-lib Installed. Nothing to DO"
fi

chkconfig --levels 235 nfs on 
/etc/init.d/nfs start

if [ -d "$dir" ]; then
  echo "$dir Found"
else 
  echo "Creating a new directory.."
  mkdir "$dir"
  chown 65534:65534 "$dir"
  chmod 777 "$dir"
  echo "Directory created.."	
fi
echo "Updating Export Script..."
echo "$dir"  "	"  "	"  "$ipaddr""("$opt")" >> /etc/exports
exportfs -a
echo "Export Script Updated..."

