module TaggedEventFinder
  
  def self.included(base)
    base.class_eval {
      alias_method_chain :event_finder, :tags
    }
  end

  def event_finder_with_tags(tag)
    ef = event_finder_without_tags(tag)
    ef = ef.from_tags(requested_tags) if requested_tags.any?
    ef
  end

end