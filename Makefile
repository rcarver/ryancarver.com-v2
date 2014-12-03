# BUILDENV (dev|prod) determines what kind of build to perform.
BUILDENV?=dev

# Path to host the pages at.
BASEURL=/archives/v2

# Describe the src->build->dist workflow.
DISTDIR=dist$(BASEURL)
BUILDDIR=build
SRCDIR=src

# Tools
# -----------------------------------------------------------------------------

NODEPATH=/usr/local/bin

KITIFY=PATH=$(NODEPATH) tools/kitify

LIVERELOAD=tools/livereload-start
LIVERELOAD_UPDATE=tools/livereload-update

SASS=PATH=$(NODEPATH) node_modules/node-sass/bin/node-sass
SASSFLAGS=--output-style compressed

UGLIFY=PATH=$(NODEPATH) node_modules/uglify-js/bin/uglifyjs
UGLIFYFLAGS=

# Find output files
# -----------------------------------------------------------------------------

css_out=$(DISTDIR)/css/main.css

js_out=$(DISTDIR)/js/main.js

img_in=$(wildcard img/**/**/*.* img/**/*.* img/*.*)
img_out=$(patsubst img/%,$(DISTDIR)/img/%,$(img_in))

bootstrap_in=$(wildcard vendor/bootstrap/css/*.min.css)
bootstrap_out=$(patsubst vendor/bootstrap/css/%,$(DISTDIR)/bootstrap/css/%,$(bootstrap_in))

pages_in=$(filter-out $(SRCDIR)/pages/_%,$(wildcard $(SRCDIR)/pages/*.kit))
pages_out=$(patsubst $(SRCDIR)/pages/%.kit,$(DISTDIR)/%.html,$(pages_in))


# Public API
# =============================================================================

.DEFAULT_GOAL:=$(BUILDENV)

dev:
	BUILDENV=dev $(MAKE) build dist

prod: 
	BUILDENV=prod $(MAKE) clean build dist

dist: $(css_out) $(js_out) $(img_out) $(bootstrap_out) $(pages_out)

clean:
	rm -rf build dist

.PHONY: dev prod dist build_dev build_prod clean


# Distribute. Package and optimize files for deployment.
# =============================================================================

$(DISTDIR)/img/%: img/%
	@mkdir -p $(dir $@)
	cp $? $@

$(DISTDIR)/bootstrap/%: vendor/bootstrap/%
	@mkdir -p $(dir $@)
	cp $? $@

$(DISTDIR)/css/%.css: $(BUILDDIR)/scss/%.scss
	@mkdir -p $(dir $@)
	$(SASS) $(SASSFLAGS) $^ $@

$(DISTDIR)/js/%.js: $(BUILDDIR)/js/%.js
	@mkdir -p $(dir $@)
	$(UGLIFY) $(UGLIFYFLAGS) $^ > $@

$(DISTDIR)/%.html: $(BUILDDIR)/pages/%.kit
	@mkdir -p $(dir $@)
	$(KITIFY) $^ > $@


# Build. Copy src files and perform modifications based on the environment.
# =============================================================================

src_in=$(shell find $(SRCDIR) -type f)

build: $(src_in:$(SRCDIR)/%=$(BUILDDIR)/%) set_buildenv_variables

set_buildenv_variables:
	echo '<!-- $$baseurl=$(BASEURL) -->' > $(BUILDDIR)/pages/_variables.kit
	echo '$$baseurl:"$(BASEURL)";' > $(BUILDDIR)/scss/_variables.scss
ifeq ($(BUILDENV),prod)
	echo "PRODUCTION!!!"
	echo '' > $(BUILDDIR)/pages/_livereload.kit
endif

$(BUILDDIR)/%: $(SRCDIR)/%
	@mkdir -p $(dir $@)
	cp $^ $@


# Development. Tools to help you make changes.
# =============================================================================

watch:
	watchman watch $(shell pwd)
	watchman -- trigger $(shell pwd) remake 'src/*.kit' 'src/*.scss' 'src/*.js' -- make dev
	watchman -- trigger $(shell pwd) livereload 'dist/*.html' 'dist/*.css' 'dist/*.js' -- $(LIVERELOAD_UPDATE)

watch_stop:
	watch_stop shutdown-server

webserver:
	cd dist && python -m SimpleHTTPServer 4000

livereload:
	@$(LIVERELOAD)

work: 
	$(MAKE) -j watch webserver livereload


# Deployment. Push the production files live.
# =============================================================================

DRYRUN?=--dry-run

deploy: prod
	s3cmd --config=.s3cfg sync $(DISTDIR)/ $(DRYRUN) --delete-removed s3://www.ryancarver.com$(BASEURL)/


