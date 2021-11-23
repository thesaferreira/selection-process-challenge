class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @comment = current_user.comments.new(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    
    if @comment.save
      redirect_to @comment.post, notice: 'Comentário enviado com sucesso'
    else
      redirect_to @comment.post, notice: 'Falha no envio do comentário'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
