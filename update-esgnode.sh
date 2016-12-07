#!/bin/bash
script_version='v2.4.5-devel-release'
script_release='Bifrost'
script_maj_version='2.4'
devel=1
srcdir=./esgf-installer
pushd $srcdir
if [ $devel -eq 0 ]; then 
	git checkout master;
	else 
	git checkout devel;
fi
git pull
git log|head -5
popd
####Do not change below this line####
replace_version='v2.0-RC5.4.0-devel'
replace_release='Centaur'
replace_script_maj_version='2.0'
quotedsv=`echo "$replace_version" | sed 's/[./*?|]/\\\\&/g'`;
quotedsr=`echo "$replace_release" | sed 's/[./*?|]/\\\\&/g'`;
quotedmj=`echo "$replace_script_maj_version" | sed 's/[./*?|]/\\\\&/g'`;

if [ $devel -eq 1 ]; then
	installerdir=./prod/dist/devel/esgf-installer/$script_maj_version
	lastpushdir=./prod/dist/devel
else
	installerdir=./prod/dist/esgf-installer/$script_maj_version
	lastpushdir=./prod/dist
fi
cat $srcdir/esg-node|sed "s/\(script_version=\"$quotedsv\"\)/script_version=\"$script_version\"/" >$installerdir/esg-node; 
sed -i "s/\(script_release=\"$quotedsr\"\)/script_release=\"$script_release\"/" $installerdir/esg-node;
sed -i "s/\(script_maj_version=\"$quotedmj\"\)/script_maj_version=\"$script_maj_version\"/" $installerdir/esg-node;
allok=0
cd $installerdir && allok=1;
if [ $allok -eq 1 ]; then
	md5sum esg-node >esg-node.md5; 
	dt=`date`;
	cd $lastpushdir
	echo $dt >lastpush;
	md5sum lastpush >lastpush.md5;
fi
