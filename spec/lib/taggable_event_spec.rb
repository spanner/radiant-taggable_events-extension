require File.dirname(__FILE__) + '/../spec_helper'

describe Calendar do
  dataset :events

  it "should report itself taggable" do
    Calendar.has_tags?.should be_true
  end

  it "should have attached tags" do
    calendars(:local).attached_tags.should == Tag.from_list("ideas")
  end
end

describe EventVenue do
  dataset :events

  it "should report itself taggable" do
    EventVenue.has_tags?.should be_true
  end

  it "should have attached tags" do
    event_venues(:somewhere).attached_tags.should == Tag.from_list("colourless, green")
  end
end

describe Event do
  dataset :events
  
  it "should report itself taggable" do
    Event.has_tags?.should be_true
  end

  it "should have attached tags" do
    events(:other).attached_tags.include?(Tag.for('furiously')).should be_true
  end
  
  it "should inherit tags from its calendar" do
    events(:simple).attached_tags.include?(Tag.for('ideas')).should be_true
  end

  it "should inherit tags from its venue" do
    events(:simple).attached_tags.include?(Tag.for('colourless')).should be_true
  end
  
  it "should return a list of all its tags" do
    events(:simple).attached_tags.should == Tag.from_list("colourless, green, ideas, sleep, furiously")
  end

end
