module ApplicationHelper
  def nbspify(str)
    sanitize(str).gsub(/ /,'&nbsp;').html_safe
  end
end
