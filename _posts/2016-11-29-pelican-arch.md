---
layout: post
title: Starting a Blog with Pelican and Arch Linux
subtitle: Why (and how) I installed Pelican on Arch Linux instead of Jekyll
date: 29th November 2016
tags: pelican, arch, linux, blog, website
---

I've been thinking for a while about blogging about some of the geeky stuff I do on my computer. Mostly in order to document my technical misadventures for my future reference, with the possibility that they might be useful to someone else out there. Recently I decided to do it, and that I'd use [GitHub Pages](https://pages.github.com/) to host the blog. I'd use some sort of static site generation tool to help me make the content pretty, because there's no way I was going to play around with HTML.

There are a lot of static site generation tools out there, the most popular and best documented of which is [Jekyll](https://jekyllrb.com/). Normally the fact that it's well documented would be enough to sway me to use it, but it has a big disadvantage that made me look elsewhere: It's not in the repos for Arch Linux (my Linux of choice). 

That means I'd either have to install it from the AUR (but this was a no-go as it had about 10 other AUR dependencies and I don't really like AUR helpers) or via ruby gems. I'm not a fan of those language based package managers like gems, pip, cabal-install etc as they are typically a lot less versatile than distribution-level package managers like apt-get and pacman.

So I did some searching for a similar tool that was in the repos, and came across [Pelican](http://blog.getpelican.com/). Pelican is in the Arch Linux community repo, so installing it is exactly this simple:

    $ sudo pacman -S pelican

I followed [this](http://mathamy.com/migrating-to-github-pages-using-pelican.html) blog post, and also the [official documentation](http://docs.getpelican.com/en/3.6.3/index.html) to get up and running, but when I tried to compile a markdown test-post, I got the following:

    $ pelican
    WARNING: No valid files found in content.
    Done: Processed 0 articles, 0 drafts, 0 pages and 0 hidden pages in 0.07 seconds.

A google search revealed that since I didn't have the python markdown library installed, I couldn't publish anything written in markdown. The official documentation suggested I install the library with this command:

    $ pip install markdown

but as I've said, I wanted to do things via pacman, so instead I ran this command to get it working:

    $ sudo pacman -S python-markdown

I like that Pelican is written in python. Even though I'm very much in the static types camp, I've always had a soft spot for python. It's another small advantage over Jekyll, since I've never used ruby.

Hopefully this is the first of many posts on my new Pelican blog!
