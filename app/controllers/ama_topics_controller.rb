class AmaTopicsController < ApplicationController
  layout "ama"

  def show
    @ama_topic = AmaTopic.find(params[:id])
  end

  def new
    @ama_topic = AmaTopic.new
  end

  def create
    @ama_topic = AmaTopic.new(ama_params)
    @mentor = Mentor.new(mentor_params)
    @ama_topic.mentor = @mentor
    saved = false
    begin
      ActiveRecord::Base.transaction do
        saved = @mentor.save! && @ama_topic.save!
      end
    rescue => e
      flash.now[:error] = e.message
      render :new
    end
    if saved
      redirect_to @ama_topic, notice: '创建成功'
    end
  end

  def edit
    @ama_topic = AmaTopic.find(params[:id])
  end

  def update
    @ama_topic = AmaTopic.find(params[:id])
    @mentor = @ama_topic.mentor
    updated_ama_params = ama_params.delete_if { |k, v| v.blank? }
    updated_mentor_params = mentor_params.delete_if { |k, v| v.blank? }
    if @ama_topic.update(updated_ama_params) && @mentor.update(updated_mentor_params)
      redirect_to @ama_topic, notice: '更新成功'
    else
      flash.now[:error] = @ama_topic.errors.full_messages.first || @mentor.errors.full_messages.first
      render 'edit'
    end
  end

  private
  def ama_params
    params.require(:ama_topic).permit(:image, :mentor_name, :title, :content)
  end

  def mentor_params
    { :email => params[:mentor_email] }
  end
end
