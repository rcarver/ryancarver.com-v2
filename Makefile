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
IMGDIR=src/img
FONTDIR=src/fonts
PHOTODIR=photos

# Tools
# -----------------------------------------------------------------------------

NODEPATH=/usr/local/bin

KITIFY=PATH=$(NODEPATH) tools/kitify

LIVERELOAD=tools/livereload-start
LIVERELOAD_UPDATE=tools/livereload-update

SASS=PATH=$(NODEPATH) node_modules/node-sass/bin/node-sass
SASSFLAGS=--output-style compressed

UGLIFY=PATH=$(NODEPATH) node_modules/uglify-js/bin/uglifyjs
UGLIFYFLAGS=--compress --mangle

IMAGEOPTIM=node_modules/imageoptim-cli/bin/imageOptim
IMAGEOPTIMFLAGS=--image-alpha --jpeg-mini --quit


# Find output files
# -----------------------------------------------------------------------------

main_css=$(DISTDIR)/css/main.css
css_libs=vendor/bootstrap/css/bootstrap.min.css

main_js=$(DISTDIR)/js/main.js
js_libs=vendor/jquery-1.11.1.min.js vendor/jquery.lazyload.js

img_in=$(wildcard $(IMGDIR)/**/**/*.* $(IMGDIR)/**/*.* $(IMGDIR)/*.*)
img_out=$(patsubst $(IMGDIR)/%,$(DISTDIR)/img/%,$(img_in))

fonts_in=$(wildcard $(FONTDIR)/**/*.*)
fonts_out=$(patsubst $(FONTDIR)/%,$(DISTDIR)/fonts/%,$(fonts_in))

bootstrap_in=$(wildcard vendor/bootstrap/css/*.min.css)
bootstrap_out=$(patsubst vendor/bootstrap/css/%,$(DISTDIR)/bootstrap/css/%,$(bootstrap_in))

pages_in=$(filter-out $(SRCDIR)/pages/_%,$(wildcard $(SRCDIR)/pages/*.kit))
pages_out=$(patsubst $(SRCDIR)/pages/%.kit,$(DISTDIR)/%.html,$(pages_in))

photos_full=$(wildcard $(PHOTODIR)/full/**/**/*.* $(PHOTODIR)/full/**/*.* $(PHOTODIR)/full/*.*)

photos_lg=$(patsubst $(PHOTODIR)/full/%,$(PHOTODIR)/lg/%,$(photos_full))
photos_sm=$(patsubst $(PHOTODIR)/full/%,$(PHOTODIR)/sm/%,$(photos_full))
photos_to_convert=$(photos_lg) $(photos_sm)

photos_all=$(photos_full) $(photos_lg) $(photos_sm)
photos_out=$(patsubst $(PHOTODIR)/%,$(DISTDIR)/img/gallery/%,$(photos_all))


# Public API
# =============================================================================

default: clean dev
dev: build dist work
redev: build dist

prod: 
	BUILDENV=prod $(MAKE) clean build dist

deploy: 
	BUILDENV=prod $(MAKE) prod upload

clean:
	rm -rf $(BUILDDIR) $(DISTDIR)

clean_all: clean clean_photos

deps:
	npm i
	brew install watchman
	brew install imagemagick

.PHONY: dev prod build deploy clean deps upload


# Distribute. Package and optimize files for deployment.
# =============================================================================

dist: $(main_css) $(main_js) $(img_out) $(photos_out) $(fonts_out) $(pages_out) convert_photos

.PHONY: dist

$(DISTDIR)/img/gallery/%: $(PHOTODIR)/%
	@mkdir -p $(dir $@)
	cp $< $@

$(DISTDIR)/img/%: $(IMGDIR)/%
	@mkdir -p $(dir $@)
	cp $< $@

$(DISTDIR)/fonts/%: $(FONTDIR)/%
	@mkdir -p $(dir $@)
	cp $< $@

$(DISTDIR)/css/%.css: $(BUILDDIR)/scss/%.scss $(wildcard $(BUILDDIR)/scss/_*.scss) $(css_libs)
	@mkdir -p $(dir $@)
	$(SASS) $(SASSFLAGS) $< $@.tmp
	cat $(css_libs) $@.tmp > $@
	@rm $@.tmp

$(DISTDIR)/js/%.js: $(BUILDDIR)/js/%.js $(js_libs)
	@mkdir -p $(dir $@)
	$(UGLIFY) $(UGLIFYFLAGS) -- $(js_libs) $< > $@

$(DISTDIR)/%.html: $(BUILDDIR)/pages/%.kit $(wildcard $(BUILDDIR)/pages/_*.kit)
	@mkdir -p $(dir $@)
	$(KITIFY) $< > $@


# Build Gallery images.
# =============================================================================

convert_photos: $(photos_to_convert)

clean_photos: 
	rm -rf $(PHOTODIR)/sm
	rm -rf $(PHOTODIR)/lg


.PHONY: convert_photos clean_photos

$(PHOTODIR)/lg/%: $(PHOTODIR)/full/%
	@mkdir -p $(dir $@)
	convert $< -resize 800 $@

$(PHOTODIR)/sm/%: $(PHOTODIR)/full/%
	@mkdir -p $(dir $@)
	convert $< -resize 480 $@


# Build. Copy src files and perform modifications based on the environment.
# =============================================================================

src_in=$(shell find $(SRCDIR) -type f)
build_configs=$(BUILDDIR)/pages/_variables.kit $(BUILDDIR)/pages/_livereload.kit $(BUILDDIR)/scss/_variables.scss 

build: $(src_in:$(SRCDIR)/%=$(BUILDDIR)/%) $(build_configs)

$(BUILDDIR)/%: $(SRCDIR)/%
	@mkdir -p $(dir $@)
	cp $^ $@

$(BUILDDIR)/pages/_variables.kit:
	echo '<!-- $$baseurl=$(BASEURL) -->' > $@

$(BUILDDIR)/pages/_livereload.kit:
ifeq ($(BUILDENV),prod)
	echo '' > $@
endif

$(BUILDDIR)/scss/_variables.scss:
	echo '$$baseurl:"$(BASEURL)";' > $@


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
