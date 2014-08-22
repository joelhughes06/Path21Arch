class VoteController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
		@vote = Vote.new
		@ip = request.remote_ip
	end

	def create
		@post = Post.find(params[:post_id])
		@vote = Vote.new(params.require(:id).permit!)
		@vote.post = @post
		@ip = request.remote_ip
		@vote.ip = @ip
		if @vote.save
			flash[:success] = "Thanks for liking!"
			redirect_to root_path
		else
			render :new
		end

	end

end