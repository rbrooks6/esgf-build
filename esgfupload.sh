#!/bin/bash
if [ $# -eq 0 ]; then
	rsync -arWvu $HOME/esgf-work/dist-repos/prod/ -e ssh --delete esgf@distrib-coffee.ipsl.jussieu.fr:/home/esgf/esgf/ 2>&1 |tee esgfupload.log
else
	rsync -arWvun $HOME/esgf-work/dist-repos/prod/ -e ssh --delete esgf@distrib-coffee.ipsl.jussieu.fr:/home/esgf/esgf/ 2>&1 |tee esgfupload.log
fi
