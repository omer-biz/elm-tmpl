main=src/Main.elm
main_output=main.js
index=index.html
build_output_dir=build

live: $(main) $(index)
	 elm-live $(main) -s $(index) -p 8000 -h 0.0.0.0 -- --debug --output=$(main_output)

build: $(main) $(index)
	@mkdir $(build_output_dir)
	elm make --optimize --output=$(main_output) $(main)
	cp $(main_ouput) $(index) $(build_output_dir)
