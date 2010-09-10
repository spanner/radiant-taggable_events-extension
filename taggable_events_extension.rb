# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

class TaggableEventsExtension < Radiant::Extension
  version "1.1.0"
  description "A tiny bit of glue to attach tags to event_calendar events and define some radius tags useful on calendar pages"
  url "http://github.com/spanner/radiant-taggable_events-extension"
    
  def activate
    Event.send :is_taggable
    EventsController.send :include, TaggedEventsController
  end
  
end
