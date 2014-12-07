require 'tempfile'
require 'open3'

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
        Open3.popen3("w3m -dump -T text/html") do |stdin, stdout, stderr|
          stdin.puts self.to_s
          stdin.close
          stdout.read
        end
      when :lynx
        Open3.popen3("lynx -dump -nonumbers -nolist -stdin") do |stdin, stdout, stderr|
          stdin.puts self.to_s
          stdin.close
          stdout.read
        end
      when :links
        Tempfile.open ["as_foo", ".html"] do |src|
          src.puts self.to_s
          src.flush

          `links -dump #{src.path}`
        end
      when :elinks
        Open3.popen3("elinks -dump -no-numbering -no-references") do |stdin, stdout, stderr|
          stdin.puts self.to_s
          stdin.close
          stdout.read
        end
      else
        raise ArgumentError.new("unexpected method #{pager}")
      end
    end
  end
end
