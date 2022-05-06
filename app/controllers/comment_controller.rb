class CommentController < ApplicationController
 def create
	respond_to do |format|
		format.html do
			post = Post.find(params[:post_id])
			user = current_user
			values = params.require(:comment).permit(:text)
			comment = Comment.new(text: values[:text])
			comment.author_id = user.id
			comment.post_id = post.id
						
			if comment.save
				redirect_to "/user/#{post.author.id}/post/#{post.id}"
			end
		end
	end
 end
end