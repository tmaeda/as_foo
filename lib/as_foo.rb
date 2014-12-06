require "as_foo/version"
require "as_foo/as_html"
require "as_foo/as_markdown"

module AsFoo
end

class String
  include AsFoo::AsHtml
  include AsFoo::AsMarkdown
end
