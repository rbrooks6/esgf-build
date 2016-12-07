#!/bin/bash

fulllist='esgf-dashboard esgf-desktop esgf-getcert esgf-idp esgf-installer esgf-node-manager esgf-publisher-resources esgf-security esg-orp esg-publisher esg-search'
active_branch='devel'


echo -n >taglist;
for i in $fulllist; do
	echo $i;
	echo $i >>taglist;
	echo "----------------------------" >>taglist;
	cd $i;
	git checkout $active_branch;
	git pull;
	git describe; 
	git describe>>../taglist; 
	cd ..
done
