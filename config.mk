### Build Configuration ###

# Default variables
GAME_VERSION  ?= RUBY
GAME_REVISION ?= 0
GAME_LANGUAGE ?= ENGLISH
DEBUG         ?= 0
COMPARE  ?= 1

# Version
ifeq ($(GAME_VERSION), RUBY)
  BUILD_NAME := ruby
else
ifeq ($(GAME_VERSION), SAPPHIRE)
  BUILD_NAME := sapphire
else
  $(error unknown version $(GAME_VERSION))
endif
endif

# Revision
ifeq ($(GAME_REVISION), 0)
  BUILD_NAME := $(BUILD_NAME)
else
ifeq ($(GAME_REVISION), 1)
  BUILD_NAME := $(BUILD_NAME)_rev1
else
ifeq ($(GAME_REVISION), 2)
  BUILD_NAME := $(BUILD_NAME)_rev2
else
  $(error unknown revision $(GAME_REVISION))
endif
endif
endif

# Language
ifeq ($(GAME_LANGUAGE), ENGLISH)
  BUILD_NAME := $(BUILD_NAME)
else
ifeq ($(GAME_LANGUAGE), GERMAN)
  BUILD_NAME := $(BUILD_NAME)_de
else
  $(error unknown language $(GAME_LANGUAGE))
endif
endif

# Debug
ifeq ($(DEBUG), 1)
  BUILD_NAME := $(BUILD_NAME)_debug
endif

