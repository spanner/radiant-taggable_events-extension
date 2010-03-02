class ImportKeywords < ActiveRecord::Migration
  def self.up
    Event.find(:all).each { |event| event.tags_from_keywords }
  end

  def self.down

  end
end
