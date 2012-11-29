require "resources_id_replace/version"
require 'action_dispatch'

ActionDispatch::Routing::Mapper::Resources::Resource.class_eval do
  def id_replacer
    (@options[:replace_id_with] || 'id').to_s
  end

  def member_scope
    "#{path}/:#{id_replacer}"
  end

  def nested_scope
    "#{path}/:#{singular}_#{id_replacer}"
  end
end
ActionDispatch::Routing::Mapper::Resources::RESOURCE_OPTIONS << :replace_id_with
