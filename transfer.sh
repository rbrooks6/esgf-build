#!/bin/bash
declare -A dists
dists[esgf-dashboard-dist.tgz]='esgf-dashboard'
dists[esgf-desktop-dist.tgz]='esgf-desktop'
dists[esgf-getcert-dist.tgz]='esgf-getcert'
dists[esgf-idp-dist.tgz]='esgf-idp'
dists[esgf-installer-dist.tgz]='esgf-installer'
dists[esgf-node-manager-dist.tgz]='esgf-node-manager'
dists[esgf-security-dist.tgz]='esgf-security'
dists[esg-orp-dist.tgz]='esg-orp'
dists[esg-search-dist.tgz]='esg-search'
dists[esgf-product-server-dist.tgz]='esgf-product-server'
dists[esgf-cog-dist.tgz]='esgf-cog'
dists[filters-dist.tgz]='filters'
devel=1
for i in "${!dists[@]}"; do
	tgtdir=${dists[$i]};
	if [ $devel -eq 1 ]; then
		cp final-dists/$i prod/dist/devel/$tgtdir/;
		cd prod/dist/devel/$tgtdir;
		uz $i && rm -f $i;
		else 
		cp final-dists/$i prod/dist/$tgtdir/;
		cd prod/dist/$tgtdir;
		uz $i && rm -f $i;
	fi
	if [ "$tgtdir" = "esgf-installer" ]; then
		mv esg-globus* ../externals/bootstrap/
	fi
	
	cd - 
done
