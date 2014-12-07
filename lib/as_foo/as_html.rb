require 'tempfile'

module AsFoo
  module AsHtml
    # @return [String] converted string
    def as_html(with: :w3m, options: nil)
      case with
      when :w3m
        IO.popen("w3m -dump -T text/html", "w") do |w3m|
          w3m.puts self.to_s
        end
      when :lynx
        IO.popen("lynx -dump -nonumbers -nolist -stdin", "w") do |lynx|
          lynx.puts self.to_s
        end
      when :links
        Tempfile.open ["as_foo", ".html"] do |src|
          src.puts self.to_s
          src.flush

          `links -dump #{src.path}`
        end
      when :elinks
        IO.popen("elinks -dump -no-numbering -no-references", "w") do |elinks|
          elinks.puts self.to_s
        end
      else
        raise ArgumentError.new("unexpected method #{with}")
      end
    end
  end
end
