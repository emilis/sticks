
default: rebuild

# --- Building: --------------------------------------------------------------

##
# Compile LESS files:
#
LESSC_DIR = static/css
LESSC_FILES = $(LESSC_DIR)/default.less $(LESSC_DIR)/theme.less $(LESSC_DIR)/theme/*.less $(LESSC_DIR)/bootstrap/*.less
LESSC_CMD = lessc
LESSC_OPT = --compress
LESSC_IN = static/css/default.less
LESSC_OUT = static/css/default.css
CSS_CMD = yui-compressor --type css
CSS_OUT = static/default.css

$(LESSC_OUT) : $(LESS_FILES)
	$(LESSC_CMD) $(LESSC_OPT) $(LESSC_IN) $(LESSC_OUT)

$(CSS_OUT) : $(LESSC_OUT)
	$(CSS_CMD) -o $(CSS_OUT) $(LESSC_OUT)


##
# Compile JavaScript files:
#
JS_DIR = static/js
JS_FILES = $(JS_DIR)/jquery/jquery-1.7.1.js

JS_CMD = yui-compressor
JS_TMP = $(JS_DIR)/default.js
JS_OUT = static/default.js

$(JS_TMP) : $(JS_FILES)
	cat $(JS_FILES) > $(JS_TMP);

$(JS_OUT) : $(JS_TMP)
	$(JS_CMD) -o $(JS_OUT) $(JS_TMP)


##
# Compile HTML files:
html: $(CSS_OUT) $(JS_OUT)
	jekyll


# --- Main rules: ------------------------------------------------------------


##
# Start a test server:
#
run : rebuild
	jekyll --server

##
# The rule to make them all:
#
all : rebuild


##
# Default rule to just update development versions
rebuild : html


