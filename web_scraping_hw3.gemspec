# frozen_string_literal: true

require_relative "lib/web_scraping_hw3/version"

Gem::Specification.new do |spec|
  spec.name          = "web_scraping_hw3"
  spec.version       = WebScrapingHw3::VERSION
  spec.authors       = ["Vichisorn"]
  spec.email         = ["james31366@gmail.com"]

  spec.summary       = "Web Scraping for Set website"
  spec.description   = "This gem is web scraping from assignment 2 in Soft spec design lab"
  spec.homepage      = "https://github.com/james31366/Web-Scraping-HW3-SSD"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/james31366/Web-Scraping-HW3-SSD"
  spec.metadata["changelog_uri"] = "https://github.com/james31366/Web-Scraping-HW3-SSD/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependency gem
  spec.add_dependency "httparty", "~> 0.18.1"
  spec.add_dependency "nokogiri", "~> 1.11.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
