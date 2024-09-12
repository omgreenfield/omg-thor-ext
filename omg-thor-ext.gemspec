# frozen_string_literal: true

require_relative 'lib/thor_ext'

Gem::Specification.new do |spec|
  spec.name = 'omg-thor-ext'
  spec.version = ThorExt::VERSION
  spec.authors = ['Matthew Greenfield']
  spec.email = ['mattgreenfield1@gmail.com']

  spec.summary = "Packages Matt Brictson's extension to make Thor behave like a typical CLI"
  spec.description = 'Original source: https://github.com/mattbrictson/gem/blob/main/lib/example/thor_ext.rb'
  spec.homepage = 'https://github.com/omgreenfield/thor-ext'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.7'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.require_paths = ['lib']

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[.git Gemfile])
    end
  end
end
