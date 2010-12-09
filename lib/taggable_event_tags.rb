module TaggableEventTags
  include Radiant::Taggable
  class TagError < StandardError; end

  desc %{ 
    Presents a tag cloud built from the current set of events.
  
    See r:tag_cloud for formatting and linking parameters. By default we show the top 50 most used tags.
  
    *Usage:*
    <pre><code><r:events:tag_cloud /></code></pre>
  }
  tag 'events:tag_cloud' do |tag|
    options = tag.attr.dup
    tag.locals.events ||= get_events(tag)
    limit = options.delete('limit') || 50
    tag.locals.tags = Tag.sized(Tag.attached_to(tag.locals.events).most_popular(limit))
    tag.render('tags:cloud', options)
  end
  
  desc %{ 
    Presents a tag cloud built from the entire population of events.
  
    See r:tag_cloud for formatting and linking parameters. By default we show the top 50 most used tags.
  
    *Usage:*
    <pre><code><r:all_events:tag_cloud /></code></pre>
  }
  tag 'all_events:tag_cloud' do |tag|
    options = tag.attr.dup
    limit = options.delete('limit') || 50
    tag.locals.tags = Tag.sized(Tag.attached_to(tag.locals.events).most_popular(limit))
    tag.render('tags:cloud', options)
  end
  
  def event_finder_with_tags(tag)
    ef = event_finder_without_tags(tag)
    ef = ef.from_all_tags(Tag.from_list(tag.attr['tags'])) unless tag.attr['tags'].blank?
    ef
  end

  def self.included(base)
    base.class_eval {
      alias_method_chain :event_finder, :tags
    }
  end
  
end