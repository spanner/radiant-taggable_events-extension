# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

class TaggableEventsExtension < Radiant::Extension
  version "1.2.0"
  description "A tiny bit of glue to attach tags to event_calendar events and define some radius tags useful on calendar pages"
  url "http://github.com/spanner/radiant-taggable_events-extension"
    
  def activate
    Calendar.send :is_taggable                                    # make calendars taggable 
    EventVenue.send :is_taggable                                  # make event venues taggable 
    Event.send :is_taggable                                       # make events taggable 
    Event.send :include, TaggableEvent                            # and inherit tags from venue and calendar
    EventsController.send :include, TaggedEventsController        # further complicate the retrieval of events by adding tag-filters
  end
  
end
