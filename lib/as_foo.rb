require "as_foo/version"
require "as_foo/as_html"

module AsFoo
end

class String
  include AsFoo::AsHtml
end
