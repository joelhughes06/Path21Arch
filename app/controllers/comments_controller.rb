class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(params.require(:comment).permit!)
		@comment.post = @post
		@ip = request.remote_ip
		@comment.ip = @ip
		respond_to do |format|
  	format.html { render layout: !request.xhr? }
  	end
		if @comment.save
			flash[:success] = "Thanks, your comment will appear shortly."
			redirect_to root_path
		else
			render :new
		end
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		@ip = request.remote_ip
	end

	def index
	end

	def ip_request
		@ip = request.remote_ip
		@ip = request.env['REMOTE_ADDR']
	end

end