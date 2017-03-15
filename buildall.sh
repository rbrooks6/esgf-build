#!/bin/bash

#check correctness of paths
ANT=/usr/local/ant/bin/ant
JAVADIR=/usr/
PYTHONDIR=//anaconda/bin/python
LOGDIR=$PWD/buildlogs

export JAVA_HOME=$JAVADIR
if ! echo $PATH|grep "$JAVADIR" >/dev/null; then 
	echo "Will prepend path with custom java";
	export PATH=$JAVADIR/bin:$PATH;
fi
if ! echo $PATH|grep "$PYTHONDIR" >/dev/null; then 
	echo "Will prepend path with custom python";
	export PATH=$PYTHONDIR/bin:$PATH;
fi
fulllist='esgf-node-manager esgf-security esg-orp esgf-idp esg-search esgf-dashboard esgf-desktop esgf-getcert esgf-stats-api'
#fulllist='esgf-dashboard'
for i in $fulllist; do
	echo -n >$LOGDIR/$i-clean.log
	echo -n >$LOGDIR/$i-pull.log
	echo -n >$LOGDIR/$i-build.log
	echo $i;
	cd $i;
	if [ "$i" = "esgf-getcert" ]; then
		$ANT clean 2>&1|tee $LOGDIR/$i-clean.log;
		$ANT dist 2>&1|tee $LOGDIR/$i-build.log;
		cd ..
		continue;
	fi
	$ANT clean_all 2>&1|tee $LOGDIR/$i-clean.log;
	$ANT pull 2>&1|tee $LOGDIR/$i-pull.log;
	$ANT make_dist 2>&1|tee $LOGDIR/$i-build.log;
	$ANT publish_local 2>&1|tee $LOGDIR/$i-publishlocal.log;
	cd ..
done
