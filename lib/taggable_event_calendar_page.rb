module TaggableEventCalendarPage
  include Radiant::Taggable
  
  class TagError < StandardError; end

  attr_accessor :requested_tags
  
  def requested_tags
    @requested_tags ||= (calendar_filters - [calendar_category, calendar_slug]).uniq.map {|t| Tag.find_by_title(Rack::Utils::unescape(t)) }
  end
  
  # this isn't very pleasing but it's the best way to let the controller know 
  # of our real address once tags have been added and removed.
  
  def tagged_url(tags = requested_tags)
    tagged = url + '/' + tags.select{|t| !t.nil? }.uniq.map(&:clean_title).to_param
    clean_url( tagged )
  end
  

  desc %{ 
    Presents a tag cloud built from the current set of events.
  
    See r:tag_cloud for formatting and linking parameters. By default we show the top 100 most used tags.
  
    *Usage:*
    <pre><code><r:events:tag_cloud /></code></pre>
  }
  tag 'events:tag_cloud' do |tag|
    options = tag.attr.dup
    tag.locals.events ||= get_events(tag)
    limit = options.delete('limit') || 100
    tag.locals.tags = Tag.banded(Tag.attached_to(tag.locals.events).most_popular(limit))
    tag.render('tags:cloud', options)
  end
  
  desc %{ 
    Presents a tag cloud built from the entire population of events.
  
    See r:tag_cloud for formatting and linking parameters. By default we show the top 100 most used tags.
  
    *Usage:*
    <pre><code><r:all_events:tag_cloud /></code></pre>
  }
  tag 'all_events:tag_cloud' do |tag|
    options = tag.attr.dup
    limit = options.delete('limit') || 100
    tag.locals.tags = Tag.banded(Tag.attached_to(tag.locals.events).most_popular(limit))
    tag.render('tags:cloud', options)
  end

end