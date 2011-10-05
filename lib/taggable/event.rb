module Taggable
  module Event
    def self.included(base)
      base.class_eval {
        before_validation_on_create :inherit_tags
      }
    end
    
  private
  
    # tags are inherited from context on creation but subsequently editable
  
    def inherit_tags
      self.attached_tags += calendar.attached_tags if calendar
      self.attached_tags += event_venue.attached_tags if event_venue
      self.attached_tags.uniq!
    end
    
  end
end