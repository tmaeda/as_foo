# AsFoo

Convert Ruby String object to something.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'as_foo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install as_foo

## Requirement

- `w3m`, `lynx`, `links` or `elinks` command to use `as_html` (The command used to render html is autodetected.)
- `redcarpet` gem to use `as_markdown`

## Usage

```
>> require 'as_foo'
=> true
>> md = <<MARKDOWN
# Sample
- a
- b
MARKDOWN
=> "# Sample\n- a\n- b\n"
>> md.as_markdown
=> "<h1>Sample</h1>\n\n<ul>\n<li>a</li>\n<li>b</li>\n</ul>\n"
>> md.as_markdown.as_html
Sample

  • a
  • b

=> nil
>>

>> require 'open-uri'
=> true
>> open("https://www.google.com/?hl=en").read.as_html
Search Images Maps Play YouTube Gmail Drive Calendar More >>
Web History | Settings | Sign in

                  x
                  [chrome-48] A faster way to browse the web
                              Install Google Chrome


Japan

           [                                                         ] Advanced
                                                                       searchLanguage
                       [Google Search][I'm Feeling Lucky]              tools

                        Google.co.jp offered in: 日本語
         Advertising ProgramsBusiness SolutionsAbout GoogleGoogle.com

                          (C) 2013 - Privacy & Terms

=> nil

>> open("https://www.google.com/?hl=en").read.as_html(with: :lynx)

   Search Images Maps Play YouTube Gmail Drive Calendar More ?
   Web History | Settings | Sign in


      [chrome-48.png] A faster way to browse the web
                   Install Google Chrome

   &#19982;&#35613;&#37326;&#26230;&#23376; &#29983;&#35477; 136
   &#21608;&#24180;


   _________________________________________________________
        Google Search I'm Feeling Lucky Advanced searchLanguage tools

   Google.co.jp offered in: &#26085;&#26412;&#35486;

   Advertising ProgramsBusiness SolutionsAbout GoogleGoogle.com

                          ? 2013 - Privacy & Terms
=> nil
```



## Contributing

1. Fork it ( https://github.com/tmaeda/as_foo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
