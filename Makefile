NODEPATH=/usr/local/bin

KITIFY=PATH=$(NODEPATH) tools/kitify

LIVERELOAD=tools/livereload-start
LIVERELOAD_UPDATE=tools/livereload-update

SASS=PATH=$(NODEPATH) node_modules/node-sass/bin/node-sass
SASSFLAGS=--output-style compressed

UGLIFY=PATH=$(NODEPATH) node_modules/uglify-js/bin/uglifyjs
UGLIFYFLAGS=

main.css=build/css/main.css
main.js=build/js/main.js

img_in=$(wildcard img/**/**/*.* img/**/*.* img/*.*)
img_out=$(patsubst img/%,build/img/%,$(img_in))

bootstrap_in=$(wildcard vendor/bootstrap/css/*.min.css)
bootstrap_out=$(patsubst vendor/bootstrap/css/%,build/bootstrap/css/%,$(bootstrap_in))

pages_in=$(filter-out src/pages/_%,$(wildcard src/pages/*.kit))
pages_out=$(patsubst src/pages/%.kit,build/%.html,$(pages_in))

all: build $(main.css) $(main.js) $(img_out) $(bootstrap_out) $(pages_out)

build/img/%: img/%
	@mkdir -p $(dir $@)
	cp $? $@

build/bootstrap/%: vendor/bootstrap/%
	@mkdir -p $(dir $@)
	cp $? $@

build/css/%.css: src/scss/%.scss
	@mkdir -p $(dir $@)
	$(SASS) $(SASSFLAGS) $^ $@

build/js/%.js: src/js/%.js
	@mkdir -p $(dir $@)
	$(UGLIFY) $(UGLIFYFLAGS) $^ > $@

build/%.html: src/pages/%.kit
	$(KITIFY) $^ > $@

build:
	@mkdir -p build

clean:
	rm -rf build

# Development

watch:
	watchman watch $(shell pwd)
	watchman -- trigger $(shell pwd) remake 'src/*.kit' 'src/*.scss' 'src/*.js' -- make all
	watchman -- trigger $(shell pwd) livereload 'build/*.html' 'build/*.css' 'build/*.js' -- $(LIVERELOAD_UPDATE)

webserver:
	cd build && python -m SimpleHTTPServer 4000

livereload:
	@$(LIVERELOAD)

# Run `make -j` to run all dev tasks in parallel.
dev: watch webserver livereload

# Deployment

BASEURL="/archives/v2"
DEPLOY_DRY_RUN = $NOSYNC ? "--dry-run" : nil

DRYRUN?=--dry-run

deploy:
	s3cmd --config=.s3cfg sync _site/ $(DRYRUN) --delete-removed s3://www.ryancarver.com$(BASEURL)/


