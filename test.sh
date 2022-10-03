#!/usr/bin/env bash

main_dir=$PWD
latex_cmd="lualatex --interaction=nonstopmode"

test -d results && rm -rf results

cp -r tests results

for dir in results/*; do
	cd $dir
	echo "$dir: "
	for file in *.tex; do
		echo -n -e "\t$file: "
		TEXINPUTS="$TEXINPUTS:$main_dir::" $latex_cmd $file > /dev/null
		if [ $# -eq 0 ]; then
			echo "✔"
		else
			echo "✘"
		fi
	done
	cd $main_dir
done
