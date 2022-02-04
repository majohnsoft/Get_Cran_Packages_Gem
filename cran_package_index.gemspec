# frozen_string_literal: true

require_relative "lib/cran_package_index/version"

Gem::Specification.new do |spec|
  spec.name = "cran_package_index"
  spec.version = CranPackageIndex::VERSION
  spec.authors = ["Abuchi Johnson Madumere"]
  spec.email = ["johnson.madumere@outlook.com"]

  spec.summary = "A Gem for getting all packages in a CRAN server. => https://cran.r-project.org/src/contrib/PACKAGES"
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "https://github.com/majohnsoft/Get_Cran_Packages_Gem.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/majohnsoft/Get_Cran_Packages_Gem.git"
  spec.metadata["changelog_uri"] = "https://github.com/majohnsoft/Get_Cran_Packages_Gem.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["README.md", "LICENSE", "CHANGELOG.md", "lib/**/*.rb", "lib/**/*.rake", "cran_package_index.gemspec", ".github/*.md", "Gemfile", "Rakefile"]

  spec.extra_rdoc_files = ["README.md"]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency "faraday", "~>1.9.3"
  spec.add_dependency "rubyzip", "~> 2.3"
  spec.add_dependency "faraday_middleware", "~> 1.2"
  
  spec.add_development_dependency "rubocop", "~> 0.60"
  spec.add_development_dependency "rubocop-performance", "~> 1.13.2"
  spec.add_development_dependency "rubocop-rspec", "~> 2.8.0"
end
