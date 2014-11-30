img_in=$(wildcard img/**/**/*.* img/**/*.* img/*.*)
img_out=$(patsubst img/%,build/img/%,$(img_in))

bootstrap_in=$(wildcard vendor/bootstrap/css/*.min.css)
bootstrap_out=$(patsubst vendor/bootstrap/css/%,build/bootstrap/css/%,$(bootstrap_in))

all: build $(img_out) $(bootstrap_out)

build/img/%: img/%
	@mkdir -p $(dir $@)
	cp $? $@

build/bootstrap/%: vendor/bootstrap/%
	@mkdir -p $(dir $@)
	cp $? $@

build:
	@mkdir -p build

clean:
	rm -rf build
