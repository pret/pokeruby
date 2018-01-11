### Build Configuration ###

# Default variables
VERSION  ?= RUBY
REVISION ?= 0
LANGUAGE ?= ENGLISH
COMPARE  ?= 1

# Version
ifeq ($(VERSION), RUBY)
  BUILD_NAME := ruby
else
ifeq ($(VERSION), SAPPHIRE)
  BUILD_NAME := sapphire
else
  $(error unknown version $(VERSION))
endif
endif

# Revision
ifeq ($(REVISION), 0)
  BUILD_NAME := $(BUILD_NAME)
else
ifeq ($(REVISION), 1)
  BUILD_NAME := $(BUILD_NAME)_rev1
else
ifeq ($(REVISION), 2)
  BUILD_NAME := $(BUILD_NAME)_rev2
else
  $(error unknown revision $(REVISION))
endif
endif
endif

# Language
ifeq ($(LANGUAGE), ENGLISH)
  BUILD_NAME := $(BUILD_NAME)
else
ifeq ($(LANGUAGE), GERMAN)
  BUILD_NAME := $(BUILD_NAME)_de
else
  $(error unknown language $(LANGUAGE))
endif
endif
