# Build Variables
# -----------------------------------------------------------------------------

# BUILDENV (dev|prod) determines what kind of build to perform.
BUILDENV?=dev

# Don't actually write files to prodution.
DRYRUN?=--dry-run

# Path to host the pages at.
BASEURL=/archives/v2

# Describe the src->build->dist->serve workflow.
SERVEDIR=dist/$(BUILDENV)
DISTDIR=$(SERVEDIR)$(BASEURL)
BUILDDIR=build/$(BUILDENV)
SRCDIR=src
IMGDIR=img

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

IMAGEOPTIM=node_modules/imageoptim-cli/bin/imageOptim
IMAGEOPTIMFLAGS=--image-alpha --quit


# Find output files
# -----------------------------------------------------------------------------

css_out=$(DISTDIR)/css/main.css
css_inS=$(wildcard $(IMGDIR)/**/**/*.* $(IMGDIR)/**/*.* $(IMGDIR)/*.*)


js_out=$(DISTDIR)/js/main.js

img_in=$(wildcard $(IMGDIR)/**/**/*.* $(IMGDIR)/**/*.* $(IMGDIR)/*.*)
img_out=$(patsubst $(IMGDIR)/%,$(DISTDIR)/img/%,$(img_in))

bootstrap_in=$(wildcard vendor/bootstrap/css/*.min.css)
bootstrap_out=$(patsubst vendor/bootstrap/css/%,$(DISTDIR)/bootstrap/css/%,$(bootstrap_in))

pages_in=$(filter-out $(SRCDIR)/pages/_%,$(wildcard $(SRCDIR)/pages/*.kit))
pages_out=$(patsubst $(SRCDIR)/pages/%.kit,$(DISTDIR)/%.html,$(pages_in))


# Public API
# =============================================================================

dev: clean build dist work
redev: build dist

prod: 
	BUILDENV=prod $(MAKE) clean build dist

deploy: 
	BUILDENV=prod $(MAKE) prod upload

clean:
	rm -rf $(BUILDDIR) $(DISTDIR)

deps:
	npm i
	brew install watchman

.PHONY: dev prod build deploy clean deps upload


# Distribute. Package and optimize files for deployment.
# =============================================================================

dist: $(css_out) $(js_out) $(img_out) $(bootstrap_out) $(pages_out)

.PHONY: dist

$(DISTDIR)/img/%: $(IMGDIR)/%
	@mkdir -p $(dir $@)
	cp $< $@

$(DISTDIR)/bootstrap/%: vendor/bootstrap/%
	@mkdir -p $(dir $@)
	cp $< $@

$(DISTDIR)/css/%.css: $(BUILDDIR)/scss/%.scss $(wildcard $(BUILDDIR)/scss/_*.scss)
	@mkdir -p $(dir $@)
	$(SASS) $(SASSFLAGS) $< $@

$(DISTDIR)/js/%.js: $(BUILDDIR)/js/%.js
	@mkdir -p $(dir $@)
	$(UGLIFY) $(UGLIFYFLAGS) $< > $@

$(DISTDIR)/%.html: $(BUILDDIR)/pages/%.kit $(wildcard $(BUILDDIR)/pages/_*.kit)
	@mkdir -p $(dir $@)
	$(KITIFY) $< > $@



# Build. Copy src files and perform modifications based on the environment.
# =============================================================================

src_in=$(shell find $(SRCDIR) -type f)

build: $(src_in:$(SRCDIR)/%=$(BUILDDIR)/%) set_buildenv_variables

set_buildenv_variables:
	echo '<!-- $$baseurl=$(BASEURL) -->' > $(BUILDDIR)/pages/_variables.kit
	echo '$$baseurl:"$(BASEURL)";' > $(BUILDDIR)/scss/_variables.scss
ifeq ($(BUILDENV),prod)
	echo '' > $(BUILDDIR)/pages/_livereload.kit
endif

$(BUILDDIR)/%: $(SRCDIR)/%
	@mkdir -p $(dir $@)
	cp $^ $@

$(BUILDDIR)/css/%.scss: $(BUILDDIR)/scss/%.scss

# Development. Tools to help you make changes.
# =============================================================================

opt:
	$(IMAGEOPTIM) $(IMAGEOPTIMFLAGS) --directory $(IMGDIR)

watch:
	watchman watch $(shell pwd)
	watchman -- trigger $(shell pwd) remake '$(SRCDIR)/*.kit' '$(SRCDIR)/*.scss' '$(SRCDIR)/*.js' -- make redev
	watchman -- trigger $(shell pwd) livereload '$(DISTDIR)/*.html' '$(DISTDIR)/*.css' '$(DISTDIR)/*.js' -- $(LIVERELOAD_UPDATE)

watch_stop:
	watchman shutdown-server

webserver:
	cd $(SERVEDIR) && python -m SimpleHTTPServer 4000

livereload:
	@$(LIVERELOAD)

work: 
	$(MAKE) -j watch webserver livereload


# Deployment. Show the world.
# =============================================================================

upload:
	s3cmd --config=.s3cfg sync $(DISTDIR)/ $(DRYRUN) --delete-removed s3://www.ryancarver.com$(BASEURL)/
