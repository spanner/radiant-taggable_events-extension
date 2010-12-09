# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{radiant-taggable_events-extension}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["spanner"]
  s.date = %q{2010-10-21}
  s.description = %q{A tiny bit of glue to attach tags to event_calendar events and define some radius tags useful on calendar pages}
  s.email = %q{will@spanner.org}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gitignore",
     "README.md",
     "Rakefile",
     "VERSION",
     "app/views/events/_defacet.html.haml",
     "app/views/events/_keywords.html.haml",
     "app/views/events/_other_page_parts.html.haml",
     "config/locales/en.yml",
     "cucumber.yml",
     "db/migrate/20100301074622_import_keywords.rb",
     "features/support/env.rb",
     "features/support/paths.rb",
     "lib/taggable_event.rb",
     "lib/taggable_event_tags.rb",
     "lib/tagged_events_controller.rb",
     "lib/tasks/taggable_events_extension_tasks.rake",
     "public/images/furniture/detag.png",
     "radiant-taggable_events-extension.gemspec",
     "spec/datasets/events_dataset.rb",
     "spec/datasets/tags_dataset.rb",
     "spec/lib/taggable_event_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "taggable_events_extension.rb"
  ]
  s.homepage = %q{http://github.com/spanner/radiant-taggable_events-extension}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Tagging Extension for the Radiant CMS Event_Calendar}
  s.test_files = [
    "spec/datasets/events_dataset.rb",
     "spec/datasets/tags_dataset.rb",
     "spec/lib/taggable_event_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<radiant-event_calendar-extension>, ["~> 1.3.0"])
      s.add_runtime_dependency(%q<radiant-taggable-extension>, ["~> 1.2.0"])
    else
      s.add_dependency(%q<radiant>, ["~> 0.9.0"])
      s.add_dependency(%q<radiant-event_calendar-extension>, ["~> 1.3.0"])
      s.add_dependency(%q<radiant-taggable-extension>, ["~> 1.2.0"])
    end
  else
    s.add_dependency(%q<radiant>, ["~> 0.9.0"])
    s.add_dependency(%q<radiant-event_calendar-extension>, ["~> 1.3.0"])
    s.add_dependency(%q<radiant-taggable-extension>, ["~> 1.2.0"])
  end
end

