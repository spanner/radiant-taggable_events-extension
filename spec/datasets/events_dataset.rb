class EventsDataset < Dataset::Base  
  uses :tags
  
  def load
    create_venue "Elsewhere"
    create_venue "Somewhere" do
      add_tags"colourless, green"
      create_calendar :local do
        add_tags "ideas"
        create_event 'simple', :title => "Simple", :start_date => "2009-11-03 18:30:00" do
          add_tags "sleep, furiously"
        end
        create_event 'other', :title => "Another", :start_date => "2009-11-03 18:30:00" do
          add_tags "furiously"
        end
      end
    end
  end

  helpers do
    def create_venue(title, attributes={})
      attributes = event_venue_attributes(attributes.update(:title => title))
      venue = create_model EventVenue, title.symbolize, attributes
      if block_given?
        @venue = venue
        yield
      end
    end

    def create_calendar(name, attributes={})
      attributes = calendar_attributes(attributes.update(:name => name))
      calendar = create_model Calendar, name.symbolize, attributes
      calendar.ical = calendar.build_ical(:url => 'stubbed')
      if block_given?
        @calendar = calendar
        yield
      end
    end
    
    def create_event(title, attributes={})
      attributes = event_attributes(attributes.update(:title => title))
      event = create_model Event, title.symbolize, attributes
      if block_given?
        @event = event
        yield
      end
      event
    end
    
    def add_tags(tags)
      (@event || @calendar || @venue).attached_tags << Tag.from_list(tags)
    end
  end
  
  def event_venue_attributes(attributes={})
    title = attributes[:title] || "Default"
    symbol = title.symbolize
    attributes = {
      :title => title,
      :description => 'A venue'
    }.merge(attributes)
    attributes
  end

  def calendar_attributes(attributes={})
    name = attributes[:name] || "Default"
    symbol = name.symbolize
    attributes = {
      :name => name,
      :description => 'A calendar',
      :category => 'test',
      :slug => name.to_s
    }.merge(attributes)
    attributes
  end

  def event_attributes(attributes={})
    title = attributes[:title] || "Default"
    symbol = title.symbolize
    attributes = {
      :calendar => @calendar,
      :event_venue => @venue,
      :title => title,
      :description => 'An event'
    }.merge(attributes)
    attributes
  end

  
  def add_recurrence(attributes={})
    @event.recurrence_rules.create(attributes)
  end
  
end
