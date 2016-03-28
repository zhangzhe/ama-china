class CommentsController < ApplicationController

  def create
    respond_to do |format|
      if params[:comment][:parent_id].to_i > 0
        @parent = Comment.find_by_id(params[:comment].delete(:parent_id))
        @comment = @parent.children.build(comment_params)
      else
        @comment = Comment.new(comment_params)
      end
      @ama_mentor = AmaMentor.find(params[:ama_mentor_id])
      if @comment.save && @ama_mentor.comments << @comment
        format.js {}
      else
        # TODO: error handling
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter_name, :content, :commenter_id)
  end
end
