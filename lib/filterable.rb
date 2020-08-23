require "filterable/railtie"
require "filterable/search_filter"

module Filterable
  extend ActiveSupport::Concern

  def apply_filters_on collection
    filtered_collection = collection
    self.class.filters.each do |filter|
      param_name, type, field_name = *filter
      next unless params[param_name]
      filtered_collection = SearchFilter.new(field_name || param_name, params[param_name], type)
                                        .query
                                        .call(filtered_collection)
    end

    filtered_collection
  end

  class_methods do
    def filterable_by search_param, type: :match, on: nil
      filters << [search_param, type, on]		
    end

    def filters
      @filters ||= []
    end
  end
end
