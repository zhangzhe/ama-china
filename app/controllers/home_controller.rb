class HomeController < ApplicationController
  def index
    @ama_mentors = AmaMentor.all
  end
end
