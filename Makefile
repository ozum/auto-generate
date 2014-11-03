REPORTER = list

test:
	clear
	echo Starting test *********************************************************
	./node_modules/mocha/bin/mocha
	echo Ending test

doc:
	clear
	echo Starting JSDOC
	jsdoc -c jsdoc-conf.json README-JSDOC.md

.PHONY: test doc
