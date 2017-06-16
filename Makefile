all: \
	target/style.css \
	target/extra \
	target/favicon.ico \
	target/index.html \
	target/about.html \
	target/contact.html \
	target/posts/pelican-arch.html \
	target/posts/xboxdrv-arch.html \
	target/posts/bluetooth-arch.html \
	target/posts/collatz.html

target/%.html: pages/%.md template target
	@echo "Generating $@"
	@cat template/page_preamble.html > $@
	@markdown $< >> $@
	@cat template/postamble.html >> $@

target/posts/%.html: posts/%.md template target target/posts target/posts/images
	@echo "Generating $@"
	@cat template/post_preamble.html > $@
	@markdown template/post_header.md >> $@
	@markdown $< >> $@
	@cat template/postamble.html >> $@

target/style.css: target
	@echo "Fetching stylesheet"
	@curl -o $@ https://raw.githubusercontent.com/sindresorhus/\
	github-markdown-css/gh-pages/github-markdown.css

target/posts/images/: posts/images target/posts
	cp -r posts/images $@

target/posts/: target
	mkdir -p $@

target/extra/: extra target
	cp -r $< $@

target/favicon.ico: favicon.ico target
	cp $< $@

target/:
	mkdir -p $@

clean:
	rm -rf target
