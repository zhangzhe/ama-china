class AmaUploadersController < ApplicationController
  def index
  end

  def create
    @ama_uploader = AmaUploader.new(uploader_params)
    if @ama_uploader.save
      redirect_to AmaUploader, notice: '创建成功'
    else
      flash.now[:error] = @ama_uploader.errors
      render :index
    end
  end

  private

  def uploader_params
    params.require(:ama_uploader).permit(:image) if params[:ama_uploader]
  end
end
