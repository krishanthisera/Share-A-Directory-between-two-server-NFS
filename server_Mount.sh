#!/bin/sh

if [ "$#" != 3 ]
then
echo
echo "Usage $0 <What is the source(Mount From):Clientip> <What is to mount:What is the client directory to be mount> <Where to Mount>"
echo "Please reffer : https://github.com/krishanthisera/Share-A-Directory-between-two-server-NFS"
echo
exit 1
fi


echo Author krishan thisera @iPhonik.com
ipaddr=$1
clidir=$2
srvdir=$3
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

if [ -d "$srvdir" ]; then
  echo "$srvdir Found"
else
  echo "Creating a new directory.."
  mkdir -p "$srvdir"
  chown 65534:65534 "$srvdir"
  chmod 777 "$srvdir"
  echo "Directory created.."
fi

echo "Mounting $clidir in $srvdir"
mount "$ipaddr"":""$clidir" """$srvdir" 
echo "Mounted $clidir to $srvdir"
df -h


