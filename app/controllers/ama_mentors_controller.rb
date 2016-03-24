class AmaMentorsController < ApplicationController
  layout "ama"
  def new
    @ama_mentor = AmaMentor.new
  end

  def create
    @ama_mentor = AmaMentor.new(ama_params)
    @mentor = Mentor.new(mentor_params)
    @ama_mentor.mentor = @mentor
    saved = false
    begin
      ActiveRecord::Base.transaction do
        saved = @mentor.save! && @ama_mentor.save!
      end
    rescue Exception => e
      flash.now[:error] = e.message
      render :new
    end
    if saved
      redirect_to @ama_mentor, notice: '创建成功'
    end
  end

  def show
    @ama_mentor = AmaMentor.find(params[:id])
  end

  private
  def ama_params
    params.require(:ama_mentor).permit(:avatar, :mentor_name, :mentor_title, :content)
  end

  def mentor_params
    { :email => params[:mentor_email], :password => params[:mentor_password] }
  end
end
