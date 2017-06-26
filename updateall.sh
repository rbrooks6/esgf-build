#!/bin/bash

fulllist='esgf-dashboard esgf-desktop esgf-getcert esgf-idp esgf-installer esgf-node-manager esgf-publisher-resources esgf-security esg-orp esg-publisher esg-search esgf-stats-api'

if [[ $1 == "devel" ]]; then
	active_branch='devel'
elif [[ $1 == "master" ]]; then
	active_branch='master'
else
	echo "Must choose a branch for repos to update (Primarily devel or master)"
	exit
fi
echo "active_branch: ${active_branch}"

echo -n >taglist;
for i in $fulllist; do
	echo $i;
	echo $i >>taglist;
	echo "----------------------------" >>taglist;
	cd $i;
	git checkout $active_branch;
	git pull --tags;
	git describe; 
	git describe>>../taglist;
	echo "\n" >>taglist; 
	cd ..
done
