module ApplicationHelper

  def flash_class(level)
    case level
    when "success" then "ui green message huge"
      when "error" then "ui red message huge"
      when "notice" then "ui blue message huge"
    end
  end

end
