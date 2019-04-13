
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "birthday/version"

Gem::Specification.new do |spec|
  spec.name          = "birthday"
  spec.version       = Birthday::VERSION
  spec.authors       = ["'Katie Blizzard'"]
  spec.email         = ["'kblizzard11@gmail.com'"]

  spec.summary       = "The Birthday gem scrapes fun facts on birthdays between 1901 and 2018"
  spec.description   = "The Birthday gems scrapes fun facts on birthdays between 1901 and 2018, including: days until next birthday, number of days since birth, gemstone, western zodiac sign, eastern zodiac sign, and famous people also born on the given birthday."
  spec.homepage      = "https://github.com/ktbliz/birthday"
  spec.license       = "MIT"

 
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
