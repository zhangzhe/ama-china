class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize

  helper_method :current_user
  def current_user
    current_admin || current_mentor

  end

  def authorize
    if is_admin_action? && !current_admin
      redirect_to root_path, notice: '没有权限'
    end
  end

  private
  def admin_role
    { "ama_topics" => ["edit", "update"], "ama_mentors" => ["new", "create", "edit", "update"], "ama_uploaders" => ["index", "create"] }
  end

  def is_admin_action?
    (actions = admin_role[request[:controller]]) && actions.include?(request[:action])
  end
end
