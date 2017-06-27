#!/usr/local/bin/bash

#check correctness of paths
ANT=$(which ant)
JAVA_BINARY="$(dirname $(which java))"
JAVADIR=${JAVA_BINARY%/*}
echo "JAVA_DIR: ${JAVADIR}"
PYTHONDIR="$(dirname $(which python))"
echo "PYTHONDIR: ${PYTHONDIR}"
LOGDIR=$PWD/buildlogs

export JAVA_HOME=$JAVADIR
if ! echo $PATH|grep "$JAVADIR" >/dev/null; then 
	echo "Will prepend path with custom java";
	export PATH=$JAVADIR:$PATH;
fi
if ! echo $PATH|grep "$PYTHONDIR" >/dev/null; then 
	echo "Will prepend path with custom python";
	export PATH=$PYTHONDIR:$PATH;
fi

#Uses mapfile CLI tool that's part of Bash version 4
mapfile -t fulllist < "$(dirname -- "$0")/repo_list.txt"
echo "fulllist: ${fulllist[*]}"
echo


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
