module TaggedEventsController

  def self.included(base)
    base.class_eval {
      alias_method_chain :read_parameters, :tags
      alias_method_chain :event_finder, :tags
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

end
