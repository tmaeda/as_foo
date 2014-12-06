module AsFoo
  module AsHtml
    def as_html(with: method = :w3m, options: options = nil)
      case method
      when :w3m
        IO.popen("w3m -dump -T text/html", "w") do |w3m|
          w3m.puts self.to_s
        end
      else
        raise ArgumentError.new("unexpected method #{method}")
      end
    end
  end
end
