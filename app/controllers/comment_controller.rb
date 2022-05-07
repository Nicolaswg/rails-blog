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
        if comment.save
          flash[:success] = 'Comment added correctly'
        else
          flash[:error] = 'Error! comment not added'
        end
        redirect_to "/user/#{user.id}/post/#{post.id}"
      end
    end
  end
end
