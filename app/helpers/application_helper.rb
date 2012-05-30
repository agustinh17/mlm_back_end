module ApplicationHelper
  def flash_helper
    f_names = [:notice, :error, :alert]
    fl = ''
    for name in f_names
      if flash[name]
        fl = fl + "<div class='#{name.to_s}'>#{flash[name]}</div>"
      end
      flash[name] = nil;
    end
    return raw fl
  end
end
