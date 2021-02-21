SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

# Default - top level rule is what gets ran when you run just `make`
build: tmp/.packed-inspire.sentinel tmp/.packed-checkout.sentinel tmp/.packed-product.sentinel
.PHONY: build

# Clean up the output directories; since all the sentinel files go under tmp, this will cause everything to get rebuilt
clean:
> rm -rf tmp
.PHONY: clean

# Build inspire - re-built if any file under src has been changed since tmp/.packed-inspire.sentinel was last touched
tmp/.packed-inspire.sentinel: $(shell find inspire -type f)
> mkdir -p $(@D)
> cd inspire
> npm ci
> npm run build
> cd ..
> touch $@

# Build checkout - re-built if any file under src has been changed since tmp/.packed-checkout.sentinel was last touched
tmp/.packed-checkout.sentinel: $(shell find checkout -type f)
> mkdir -p $(@D)
> cd checkout
> npm ci
> npm run build
> cd ..
> touch $@

# Build product - re-built if any file under src has been changed since tmp/.packed-product.sentinel was last touched
tmp/.packed-product.sentinel: $(shell find product -type f)
> mkdir -p $(@D)
> cd product
> npm ci
> npm run build
> cd ..
> touch $@
