module UsersHelper

  def user_display user
    html = "<div>".html_safe
    if user.role
        html += "#{user.name} (#{user.role})"
    else
        html += user.name
    end
    html+= "</div>".html_safe
  end

end
