class HomeController < ApplicationController
  before_action :detect_browser, :only => [:index]
  def index
    @ama_mentors = AmaMentor.all
  end

  private
  def detect_browser
    case request.user_agent
    when /iPhone/i
      request.variant = :phone
    when /Android/i && /mobile/i
      request.variant = :phone
    when /Windows Phone/i
      request.variant = :phone
    else
      request.variant = :desktop
    end
  end
end
