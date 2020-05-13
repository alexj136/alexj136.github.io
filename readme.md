The source for my [blog](https://alexj136.github.io).

### Getting set up

#### Ubuntu 19.10

Run

    sudo apt-get install ruby-full build-essential zlib1g-dev

Ensure the following is in `.bashrc` or equivalent:

    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH

Run

    gem install jekyll bundler jekyll-sitemap jekyll-paginate jekyll-feed

Then compile with

    jekyll build

Serve locally with 

    jekyll serve

### TODOs

- Find a good solution for the email address - captcha?
- Publications page - improve it, include abstracts
