# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-taggable_events-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-taggable_events-extension"
  s.version     = RadiantTaggableEventsExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantTaggableEventsExtension::AUTHORS
  s.email       = RadiantTaggableEventsExtension::EMAIL
  s.homepage    = RadiantTaggableEventsExtension::URL
  s.summary     = RadiantTaggableEventsExtension::SUMMARY
  s.description = RadiantTaggableEventsExtension::DESCRIPTION

  s.add_dependency "radiant-event_calendar-extension", "~> 1.5.0"
  s.add_dependency "radiant-taggable-extension", "~> 2.0.0.rc4"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]

  s.post_install_message = %{
  Add this to your radiant project with:

    config.gem 'radiant-taggable_events-extension', :version => '~> #{RadiantTaggableEventsExtension::VERSION}'

  }
end
