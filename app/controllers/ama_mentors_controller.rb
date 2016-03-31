class AmaMentorsController < ApplicationController
  layout "ama"

  def show
    @ama_mentor = AmaMentor.find(params[:id])
  end

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
    rescue => e
      flash.now[:error] = e.message
      render :new
    end
    if saved
      redirect_to @ama_mentor, notice: '创建成功'
    end
  end

  def edit
    @ama_mentor = AmaMentor.find(params[:id])
  end

  def update
    @ama_mentor = AmaMentor.find(params[:id])
    @mentor = @ama_mentor.mentor
    updated_ama_params = ama_params.delete_if { |k, v| v.blank? }
    updated_mentor_params = mentor_params.delete_if { |k, v| v.blank? }
    if @ama_mentor.update(updated_ama_params) && @mentor.update(updated_mentor_params)
      redirect_to @ama_mentor, notice: '更新成功'
    else
      flash.now[:error] = @ama_mentor.errors.full_messages.first || @mentor.errors.full_messages.first
      render 'edit'
    end
  end

  private
  def ama_params
    params.require(:ama_mentor).permit(:avatar, :mentor_name, :mentor_title, :brief, :content)
  end

  def mentor_params
    { :email => params[:mentor_email], :password => params[:mentor_password] }
  end
end
