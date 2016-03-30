class AmaUploadersController < ApplicationController
  def index
  end

  def create
    if @ama_uploader = AmaUploader.create(uploader_params)
      redirect_to AmaUploader, notice: '创建成功'
    else
      flash.now[:error] = @ama_uploader.errors
      render :index
    end
  end

  private

  def uploader_params
    params.require(:ama_uploader).permit(:image)
  end
end
