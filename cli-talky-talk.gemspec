# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli_talky_talk/version'

Gem::Specification.new do |spec|
  spec.name          = "cli-talky-talk"
  spec.version       = CLITalkyTalk::VERSION
  spec.authors       = ["Sean McCleary"]
  spec.email         = ["seanmcc@gmail.com"]
  spec.summary       = %q{Gives you a random spoken greeting}
  spec.description   = %q{Tired of staring at the terminal waiting for tasks to complete. Wouldn't it be cool if your computer could speak to you when the task is done?}
  spec.homepage      = "https://github.com/mrinterweb/cli-talky-talk"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
