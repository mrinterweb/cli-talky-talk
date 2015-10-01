# CliTalkyTalk

Ever find yourself checking the terminal to see if the last command you ran is finished? I do all the time so I wrote cli-talky-talk.

## Usage

cli-talky-talk is very easy to use. All you need to do is add `&& speak` at the end of a long running terminal command. When the command is done your computer will address you with a random message letting you know that the work is finished.

```
> <some terminal command that will take a while> && speak
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cli-talky-talk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cli-talky-talk

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cli-talky-talk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
