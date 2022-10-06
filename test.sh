#!/usr/bin/env bash

main_dir=$PWD

export TEXINPUTS="$TEXINPUT:$main_dir::"

latex_flags="--interaction=nonstopmode"
lualatex_cmd="lualatex"
xelatex_cmd="xelatex"

fmt="%-20s%12s%12s\n"
test -d results || cp -r tests results

cd tests

for dir in *; do
	test -d $main_dir/results/$dir || cp -r $dir $main_dir/results/$dir
done

cd $main_dir/results

printf "$fmt" "File" "$lualatex_cmd" "$xelatex_cmd"

for dir in *; do
	cd $dir
	cp -f $main_dir/tests/$dir/*.tex .
	printf "$fmt" "$dir/" "" ""
	for file in *.tex; do
		short_file=`basename $file .tex`
		lualatex_status="✘"
		xelatex_status="✘"
		$lualatex_cmd \
			 $latex_flags \
			 --jobname=lua-$short_file \
			 $file &> /dev/null
		if [ $# -eq 0 ]; then
			lualatex_status="✔"
		fi
		xename=xe$short_file
		$xelatex_cmd \
			 $latex_flags \
			 --jobname=xe-$short_file \
			 $file &> /dev/null
		if [ $# -eq 0 ]; then
			xelatex_status="✔"
		fi
		printf "$fmt" "    $file" "$lualatex_status" "$xelatex_status"
	done
	cd $main_dir/results
done
