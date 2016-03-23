module ApplicationHelper
  def default_title(title = '')
    title_base = 'TheaterEngine'
    if title.empty?
      title_base
    else
      "#{title_base} | #{title}"
    end
  end

  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "panel panel-danger") do
        concat(content_tag(:div, class: "panel-heading") do
                 concat(content_tag(:h4, class: "panel-title") do
                          concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
                        end)
               end)
        concat(content_tag(:div, class: "panel-body") do
                 concat(content_tag(:ul) do
                          object.errors.full_messages.each do |msg|
                            concat content_tag(:li, msg)
                          end
                        end)
               end)
      end
    end
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
