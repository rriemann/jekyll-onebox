# frozen_string_literal: true

require "onebox"

# Inspiration:
# source: https://kalifi.org/2015/08/using-discourse-onebox-with-jekyll.html
# Onebox::Engine::WhitelistedGenericOnebox.whitelist << "kalifi.org"

# module Jekyll
#   module OneboxFilter
#     def preview(url)
#       Onebox.preview(url).to_s
#     end
#   end
# end
#
# Liquid::Template.register_filter(Jekyll::OneboxFilter)

module Jekyll
  module Onebox
    class OneboxTag < Liquid::Tag
      def initialize(tag_name, url, tokens)
        super
        STDERR.puts url
        @url = url.strip
      end

      def render(context)
        @settings = context.registers[:site].config["onebox"]
        if @settings && @settings["whitelist"]
          whitelist = @settings["whitelist"]
          if whitelist.kind_of?(Array)
            whitelist.each do |domain|
              ::Onebox::Engine::WhitelistedGenericOnebox.whitelist << domain
            end
          end
        end
        ::Onebox.preview(@url).to_s
      end
    end
  end
end

Liquid::Template.register_tag('onebox', Jekyll::Onebox::OneboxTag)
