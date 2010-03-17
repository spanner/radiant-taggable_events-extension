module TaggedEventsController

  def self.included(base)
    base.class_eval {
      alias_method_chain :read_parameters, :tags
      alias_method_chain :event_finder, :tags
      alias_method_chain :list_description, :tags
      alias_method_chain :list_path, :tags
      alias_method_chain :list_filename, :tags
    }
  end

  def read_parameters_with_tags
    read_parameters_without_tags
    @tags = Tag.from_list(params[:tags], false) unless params[:tags].blank?
  end
    
  def event_finder_with_tags
    ef = event_finder_without_tags
    ef = ef.from_all_tags(@tags) if @tags && @tags.any?
    ef
  end
  
  def list_description_with_tags
    description = list_description_without_tags
    if @tags && @tags.any? 
      description << ' tagged with '
      description << @tags.map{|t| "'#{t}'"}.to_sentence
    end
    description
  end
  
  def list_path_with_tags
    path = list_path_without_tags
    path += @tags.map{|tag| URI.escape(tag.to_s)}
    path
  end

  def list_filename_with_tags
    name = [list_filename_without_tags]
    name += @tags.map{|t| t.title.downcase.gsub(/\s/, '_')}
    name.join('_')
  end

end
