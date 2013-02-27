all: clean compile

clean:
	@rm -rf ebin/*.beam

compile:
	@test -d ebin || mkdir ebin
	@erl -make

test: clean compile
	@erl -noshell -pa ebin -eval 'eunit:test("ebin",[])' -s init stop
