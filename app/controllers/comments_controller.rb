class CommentsController < ApplicationController

  def create
    respond_to do |format|
      if params[:comment][:parent_id].to_i > 0
        @parent = Comment.find_by_id(params[:comment].delete(:parent_id))
        @comment = @parent.children.build(comment_params)
      else
        @comment = Comment.new(comment_params)
      end
      @ama_mentor = AmaMentor.find(params[:ama_mentor_id]) if params[:ama_mentor_id]
      @ama_topic = AmaTopic.find(params[:ama_topic_id]) if params[:ama_topic_id]
      @ama = @ama_mentor || @ama_topic
      if @ama.comments << @comment
        format.js {}
      else
        # TODO: error handling
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js   {}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter_name, :content, :commenter_id)
  end
end
