module TaggedEventFinder
  
  def self.included(base)
    base.class_eval {
      alias_method_chain :event_finder, :tags
      alias_method_chain :filters_applied, :tags
    }
  end

  def event_finder_with_tags(tag)
    ef = event_finder_without_tags(tag)
    ef = ef.from_all_tags(calendar_tags) if tags_applied?
    ef
  end

  def filters_applied_with_tags(tag)
    filters = filters_applied_without_tags(tag)
    if tags_applied?
      tags = @calendar_tags.map { |t| %{<a href="#{tag.locals.page.url(:tags => tags_without(t))}" class="defilter">#{t}</a> } }.to_sentence
      filters << %{tagged with #{tags}}
    end
    filters
  end

end