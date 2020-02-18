class ApplicationController < ActionController::Base
  # if not Admin i.e. permission denied
  def render_403
    render file: "public/403.html", status: 403
  end

  def render_404
    render file: "public/404.html", status: 404
  end

  def check_if_admin
    if user_signed_in?
    render file: "public/403.html", status: 403 unless current_user.admin == true
    else
    render_403
    end
  end

end
