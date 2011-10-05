# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'
require "radiant-taggable_events-extension"

class TaggableEventsExtension < Radiant::Extension
  version RadiantTaggableEventsExtension::VERSION
  description RadiantTaggableEventsExtension::DESCRIPTION
  url RadiantTaggableEventsExtension::URL

  def activate
    Calendar.send :has_tags                                       # make calendars taggable 
    EventVenue.send :has_tags                                     # make event venues taggable 
    Event.send :has_tags                                          # make events taggable 
    Event.send :include, Taggable::Event                          # ...and inherit attached tags from venue and calendar on creation
    EventsController.send :include, Taggable::EventsController    # further complicate the retrieval of events by adding tag-filters
    Page.send :include, Taggable::EventTags                       # support tag conditions on r:events:* radius tags
    EventCalendarPage.send :include, Taggable::FacetedPage        # faceting tags are understood by calendar pages
  end
  
end
