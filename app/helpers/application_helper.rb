module ApplicationHelper

  def login_page?
    current_page?('/admins/sign_in') || current_page?('/mentors/sign_in')
  end

end
