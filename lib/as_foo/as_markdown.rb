module AsFoo
  module AsMarkdown
    def as_markdown(with: method = :redcarpet, options: options = nil)
      case method
      when :redcarpet
        require 'redcarpet'
        Redcarpet::Markdown.new(Redcarpet::Render::HTML, options.to_h).render(self.to_s)
      else
        raise ArgumentError.new("unexpected method #{method}")
      end
    end
  end
end
