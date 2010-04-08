module TaggedEventsController

  def self.included(base)
    base.class_eval {
      helper_method :tags, :url_with_tag, :url_without_tag
      alias_method_chain :event_finder, :tags
      alias_method_chain :continuing_events, :tags
      alias_method_chain :calendar_parameter_names, :tags
    }
  end

  def tags
    @tags ||= Tag.from_list(params[:tags], false) || []
  end
    
  def event_finder_with_tags
    ef = event_finder_without_tags
    ef = ef.from_all_tags(tags) if tags.any?
    ef
  end
  
  def continuing_events_with_tags
    continuing_events_without_tags
    @continuing_events = @continuing_events.from_all_tags(tags) if tags.any?
    @continuing_events
  end
  
  def calendar_parameter_names_with_tags
    calendar_parameter_names_without_tags + [:tags]
  end
  
  def url_without_tag(tag)
    url_for(url_parts({
      :tags => Tag.to_list(tags - [tag])
    }))
  end
  
  def url_with_tag(tag)
    url_for(url_parts({
      :tags => Tag.to_list(tags + [tag])
    }))
  end

end
