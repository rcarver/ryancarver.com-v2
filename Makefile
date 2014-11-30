SASS=node_modules/node-sass/bin/node-sass
SASSFLAGS=--output-style compressed

main.css=build/css/main.css

img_in=$(wildcard img/**/**/*.* img/**/*.* img/*.*)
img_out=$(patsubst img/%,build/img/%,$(img_in))

bootstrap_in=$(wildcard vendor/bootstrap/css/*.min.css)
bootstrap_out=$(patsubst vendor/bootstrap/css/%,build/bootstrap/css/%,$(bootstrap_in))

all: build $(main.css) $(img_out) $(bootstrap_out)

build/img/%: img/%
	@mkdir -p $(dir $@)
	cp $? $@

build/bootstrap/%: vendor/bootstrap/%
	@mkdir -p $(dir $@)
	cp $? $@

build/css/%.css: src/scss/%.scss
	@mkdir -p $(dir $@)
	$(SASS) $(SASSFLAGS) $^ $@

build:
	@mkdir -p build

clean:
	rm -rf build
