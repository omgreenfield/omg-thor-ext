# frozen_string_literal: true

require_relative 'lib/thor_ext'

Gem::Specification.new do |spec|
  spec.name = 'thor-ext'
  spec.version = ThorExt::VERSION
  spec.authors = ['Matthew Greenfield']
  spec.email = ['mattgreenfield1@gmail.com']

  spec.summary = "Packages Matt Brictson's extension to make Thor behave like a typical CLI"
  spec.description = 'Original source: https://github.com/mattbrictson/gem/blob/main/lib/example/thor_ext.rb'
  spec.homepage = 'https://github.com/omgreenfield/thor-ext'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.7'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[.git Gemfile])
    end
  end
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
