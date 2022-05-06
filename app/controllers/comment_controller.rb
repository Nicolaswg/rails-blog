class CommentController < ApplicationController
  def create
    respond_to do |format|
      format.html do
        post = Post.find(params[:post_id])
        user = User.find(params[:user_id])
        values = params.require(:comment).permit(:text)
        comment = Comment.new(text: values[:text])
        comment.author_id = user.id
        comment.post_id = post.id

        redirect_to "/user/#{user.id}/post/#{post.id}" if comment.save
      end
    end
  end
end
