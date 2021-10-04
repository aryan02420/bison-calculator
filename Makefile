# 2019A7PS0136G POPL ASSIGNMENT1 Q1
.ONESHELL:
.PHONY: all build test clean

bitsid=2019A7PS0136G
filename=$(bitsid)_assignment1

all:
	$(MAKE) clean
	$(MAKE) build
	$(MAKE) zip
	$(MAKE) test

build: 
	cd generated
	bison -d ../src/arith.y
	flex ../src/arith.l
	cc -o "../$(filename).out" ../src/main.c arith.tab.c lex.yy.c -lfl -lm

run: 
	"./$(filename).out"

test:
	"./$(filename).out" < test/input | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" > test/result
	./test/run.sh

zip:
	rm -f "$(filename).zip"
	zip "$(filename).zip" -r src/ generated/ test/ Makefile "$(filename).out" README

clean: 
	rm -f "$(filename).out" generated/** "$(filename).zip"
