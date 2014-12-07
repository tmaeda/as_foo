module AsFoo
  module AsHtml
    def as_html(with: :w3m, options: nil)
      case with
      when :w3m
        IO.popen("w3m -dump -T text/html", "w") do |w3m|
          w3m.puts self.to_s
        end
      else
        raise ArgumentError.new("unexpected method #{with}")
      end
    end
  end
end
