module ApplicationHelper

  def flash_class(level)
    case level
    when "success" then "ui green message huge"
      when "error" then "ui red message huge"
      when "notice" then "ui blue message huge"
    end
  end

  def current_cycle
    Cycle.last.period
  end 


  def pluralize_without_count_doctor(count, noun, text = nil)
    if count != 0
      count == 1 ? "Doctor #{text}" : "Doctores #{text}"
    end
  end

end
