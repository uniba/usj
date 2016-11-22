
PORT ?= 4567
MIDDLEMAN = bundle exec middleman
BUNDLE_PATH = vendor/bundle

build: bundle
	$(MIDDLEMAN) build --clean

clean:
	rm -frv ./build ./.tmp

server: bundle
	( ./node_modules/.bin/wait-on tcp:$(PORT) .tmp/dist/javascripts/all.js && open http://0.0.0.0:$(PORT)/ ) &
	$(MIDDLEMAN) server --port $(PORT) --bind-address 0.0.0.0

bundle:
	npm install
	bundle check --path $(BUNDLE_PATH) || bundle install --path $(BUNDLE_PATH)

deploy:
	$(MIDDLEMAN) deploy

.PHONY: build clean bundle deploy
