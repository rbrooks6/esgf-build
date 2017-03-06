#!/bin/bash
if [ $# -eq 0 ]; then
	echo "prodn repo"
	rsync -arWvu -e ssh --delete esgf@distrib-coffee.ipsl.jussieu.fr:/home/esgf/esgf/ $HOME/esgf-work/dist-repos/prod/ 2>&1 |tee esgf-dist.log
	echo "now on to failsafe";
	rsync -arWvu -e ssh esgf@distrib-coffee.ipsl.jussieu.fr:/home/esgf/esgf/ $HOME/esgf-work/dist-repos/failsafe/
else
	echo "prodn repo"
	rsync -arWvun -e ssh --delete esgf@distrib-coffee.ipsl.jussieu.fr:/home/esgf/esgf/ $HOME/esgf-work/dist-repos/prod/ 2>&1 |tee esgf-dist.log
	echo "now on to failsafe";
	rsync -arWvun -e ssh esgf@distrib-coffee.ipsl.jussieu.fr:/home/esgf/esgf/ $HOME/esgf-work/dist-repos/failsafe/
fi
