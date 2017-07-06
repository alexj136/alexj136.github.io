all: \
	target/favicon.ico \
	target/robots.txt \
	target/style.css \
	target/index.html \
	target/about.html \
	target/contact.html \
	target/pelican-arch.html \
	target/xboxdrv-arch.html \
	target/bluetooth-arch.html \
	target/mixing-monads.html \
	target/collatz.html

target/%.html: pages/%.md template target
	@echo "Generating $@"
	@cat template/preamble.html > $@
	@markdown $< >> $@
	@cat template/postamble.html >> $@

target/%.html: posts/%.md template target target/images
	@echo "Generating $@"
	@cat template/preamble.html > $@
	@markdown template/post_header.md >> $@
	@markdown $< >> $@
	@cat template/postamble.html >> $@

target/style.css: target
	@echo "Fetching stylesheet"
	@curl -o $@ https://raw.githubusercontent.com/sindresorhus/\
	github-markdown-css/gh-pages/github-markdown.css

target/images/: images target
	cp -r $< $@

target/%: extra/% target
	cp -r $< $@

target/:
	@echo "Pulling site repo"
	@git clone https://github.com/alexj136/alexj136.github.io target/

clean:
	rm -rf target/*.html target/images/ target/favicon.ico target/robots.txt \
	target/style.css
