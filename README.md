# Jekyll::Onebox

[![Gem Version](https://badge.fury.io/rb/jekyll-onebox.svg)](https://badge.fury.io/rb/jekyll-onebox)

Liquid tag for displaying HTML previews (embeds) for links to popular websites: `{% onebox %}`.

## Installation

Add this line to your application's Gemfile:

    $ gem 'jekyll-onebox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-onebox

Then add the following to your site's `_config.yml`:

```
plugins:
  - jekyll-onebox
```

💡 If you are using a Jekyll version less than 3.5.0, use the `gems` key instead of `plugins`.

## Usage

Use the tag as follows in your Jekyll pages, posts and collections:

```liquid
{% onebox https://github.com/rriemann/jekyll-onebox/blob/master/README.md %}
```

This will create a html preview, i.e. an embed, for websites supported by the ruby gem [onebox](https://github.com/discourse/onebox).

The html preview depends on the actual link and may be the [oEmbed](http://oembed.com/) or [Open Graph](https://developers.facebook.com/docs/opengraph/) of a (whitelisted) website with support for those previews. Onebox also comes with many engines to construct a custom preview for supported websites, such as IMDB, Amazon, Wikipedia, Spotify, Soundcloud etc.

**Pro-tip**: Onebox uses in most cases HTTP GET requests to fetch content from the provided link. With evolving website content or updates of the Onebox gem, the html preview of the same link may also evolve.

## Custom Whitelisting

If Onebox does not support a domain out of the box, but implements either [oEmbed](http://oembed.com/) or [Open Graph](https://developers.facebook.com/docs/opengraph/), than support can be added by simple whitelisting. Please find [in the Onebox code](https://github.com/discourse/onebox/blob/master/lib/onebox/engine/whitelisted_generic_onebox.rb) a list of all whitelisted domains.

If a domain is not supported and does not implement oEmbed or Open Graph, than a new engine must be added to the Onebox gem.

```yml
onebox:
  whitelist:
    - blog.riemann.cc
    - tagesschau.de
```

## TODO

- add caching of previews to speed-up page builds

## Similar Projects

- <https://kalifi.org/2015/08/using-discourse-onebox-with-jekyll.html> uses the Onebox gem for a Jekyll Filter plug-in and inspired this Tag plug-in.

## Contributing

1. Fork it ( https://github.com/rriemann/jekyll-onebox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
