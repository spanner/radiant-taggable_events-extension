# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

class TaggableEventsExtension < Radiant::Extension
  version "1.1"
  description "A bit of glue to attach tags to event_calendar events and define some radius tags useful on calendar pages"
  url "http://radiant.spanner.org/taggable_events"
    
  extension_config do |config|
    config.extension 'event_calendar'
    config.extension 'taggable'
  end
  
  def activate
    Event.send :is_taggable
    EventsController.send :include, TaggedEventsController
  end
  
  def deactivate
  end
  
end
