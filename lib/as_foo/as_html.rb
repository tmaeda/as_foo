require 'tempfile'

module AsFoo
  module AsHtml
    class << self
      def available_pager
        @@_as_foo_html_pager ||= %i(w3m elinks lynx links).find {|command|
          system("which #{command}", out: "/dev/null", err: "/dev/null")
        }
      end
    end

    # @return [String] converted string
    def as_html(with: nil, options: nil)
      pager = with || AsHtml.available_pager

      raise "could not find available pager command" unless pager

      case pager
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
        raise ArgumentError.new("unexpected method #{pager}")
      end
    end
  end
end
