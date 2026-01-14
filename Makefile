all: site lint

site:
	sbcl --noinform --load site.lisp --quit

loop:
	while true; do make site; sleep 5; done

push:
	git remote remove gh || :
	git remote remove cb || :
	git remote add gh git@github.com:hnblogs/hnblogs.github.io.git
	git remote add cb git@codeberg.org:hnblogs/pages.git
	git push -u origin main
	git push origin --all
	git push origin --tags
	git push cb --all
	git push cb --tags

lint:
	tidy -q -e index.html
