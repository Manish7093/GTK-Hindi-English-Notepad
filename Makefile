CFLAGS+=-Wall -Wextra
CFLAGS+=`pkg-config --cflags gtk+-2.0`
LIBS+=`pkg-config --libs gtk+-2.0`
PROG=gtk-notepad

SRC_NAME=src/gtk-notepad.c
LL=hi
COUNTRY=IN
TEXT_DOMAIN = notepadi18

# May cause inconsistency in calls
time=$$(date +'%Y%m%d-%H%M%S')
POT_PREFIX=$(PROG)
POT_NAME=$(POT_PREFIX)-$(time).pot
TR_LOCALE=$(LL)_$(COUNTRY)
PO_FILE=$(TR_LOCALE).po
MO_FILE=$(TEXT_DOMAIN).mo

locale-init:
	mkdir -p po
	mkdir -p i18n/$(TR_LOCALE)

	xgettext -d $(TEXT_DOMAIN) -s -o "po/$(POT_NAME)" $(SRC_NAME)
	
	if [ ! -f "i18n/$(TR_LOCALE)/$(PO_FILE)" ]; then \
		msginit -l $(TR_LOCALE) -o "i18n/$(TR_LOCALE)/$(PO_FILE)" -i "po/$(POT_NAME)"; \
	else \
		msgmerge -s -U "i18n/$(TR_LOCALE)/$(PO_FILE)" "po/$(POT_NAME)"; \
	fi

edit-locale:
	$(EDITOR) "i18n/$(TR_LOCALE)/$(PO_FILE)"

patch-locale:
	msgfmt -c -v -o "i18n/$(TR_LOCALE)/$(MO_FILE)" "i18n/$(TR_LOCALE)/$(PO_FILE)"

	if [ -e  "/usr/share/locale/$(LL)/" ]; then \
		mkdir -p ./locale/$(LL)/LC_MESSAGES; \
		cp "i18n/$(TR_LOCALE)/$(MO_FILE)" ./locale/$(LL)/LC_MESSAGES; \
	fi
	
	if [ -e  "/usr/share/locale/$(LL)_$(COUNTRY)/" ]; then \
		mkdir -p ./locale/$(LL)_$(COUNTRY)/LC_MESSAGES; \
		cp "i18n/$(TR_LOCALE)/$(MO_FILE)" ./locale/$(LL)_$(COUNTRY)/LC_MESSAGES; \
	fi


help:
	@echo -e "Available commands:"
	@echo -e "\tall - compile the program"
	@echo -e "\tclean - clean up"
	@echo -e "\thelp - print this help message"
	@echo -e "\trun - run with LOCALE set"
	@echo -e "\trun-default - run with default LOCALE"
	@echo -e "\tlocale - generate/update po files from code"
	@echo -e "\tedit-locale - opens editor for editing locales"
	@echo -e "\tpatch-locale - apply locale on /usr/share/locale/ directory to able to use"

all:
	$(CC) $(CFLAGS) -o $(PROG) src/*.c $(LIBS)

run-default:
	./$(PROG)
run:
	LANGUAGE=$(TR_LOCALE) ./$(PROG)

clean:
	rm $(PROG) po/$(POT_PREFIX)-*.pot "i18n/$(TR_LOCALE)/$(MO_FILE)"
	rm ./locale/$(LL)/LC_MESSAGES/$(MO_FILE)
	rm ./locale/$(LL)_$(COUNTRY)/LC_MESSAGES/$(MO_FILE)


