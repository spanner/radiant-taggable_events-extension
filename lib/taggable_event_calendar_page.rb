module TaggableEventCalendarPage
  require 'uri'

  def self.included(base)
    base.class_eval {
      attr_accessor :calendar_tags
      alias_method_chain :read_parameters, :tags
      alias_method_chain :url_parts, :tags
    }
  end

  def read_parameters_with_tags(path)
    read_parameters_without_tags(path)
    @calendar_tags = Tag.from_list(calendar_parameters, false)
  end
    
  def url_parts_with_tags
    parts = url_parts_without_tags
    tags = calendar_tags.map(&:title).join('/') if calendar_tags
    parts.merge!({ :tags => tags })
    parts
  end
  
  def tags_applied?
    calendar_tags && calendar_tags.any?
  end
  
  def tags_without(tag)
    calendar_tags - [tag]
  end

  def tags_with(tag)
    calendar_tags + [tag]
  end

end
