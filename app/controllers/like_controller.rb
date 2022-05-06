class LikeController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		user = current_user
		like = Like.new(author_id: user.id, post_id: post.id)

		if like.save
			redirect_to "/user/#{post.author.id}/post/#{post.id}"
		end
	end
 end