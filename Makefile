REMOTEUSER ?= mt324
HOST ?= monster.stat.duke.edu
DIR ?= ~/.public_html/datafest-covid19
REMOTE ?= $(REMOTEUSER)@$(HOST):$(DIR)

all:
	hugo_extended_0.59.1_macOS-64bit


.PHONY: clean
clean:
	rm -rf docs/*

push-img: 
	cp favicon.ico docs/
	
push: 
	rsync -azv --delete  --exclude='.DS_Store'  docs/ $(REMOTE)

unbind:
	lsof -wni tcp:4000

serve:
	hugo server --watch
