class PostsController < ApplicationController
#	before_action :require_user, only: [:new, :create, :destroy]
	before_action :set_post, only: [:vote]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@ip = request.remote_ip
#		@post.ip = @ip
	end

	def create 
		@post = Post.new[params.require(:post).permit!]
		@ip = request.remote_ip
#		@post.ip = @ip		
		if @post.save 
#			&& user_lookup
			flash[:notice] = "Thanks for your comment! It will appear shortly."
			redirect_to_root_path
		else
			render 'new'
		end
	end

	def user_lookup
		@ip = request.remote_ip
		@ip = request.env['REMOTE_ADDR']
		@email = Post.find[params[:email]]
	end

	def record_a_vote  
		@vote = Vote.new[params.require(:voter_ip).permit!]
	  @post = Post.find[params(:post_id)]
	  @vote_id = params[:vote_id]  
	  @voter_ip = request.remote_ip  
	  @vote.post_id = @post
	  unless Vote.count(:all, :conditions => ['post_id = ? AND voter_ip = ?', post_id, voter_ip]) == 0  
	    redirect_to :already_voted  
	  end  
	  
	  Post.find(post_id).record_vote(params[:post])
	  Vote.create(:post_id => @post, :voter_ip => @voter_ip)  
	end  
	  
	def already_voted  
	  render :text => "You can like a post only once."  
	end 	

	def vote
		Vote.create(params[:post_id])
		render :text => "Thanks for voting"
	end

	def set_post
		@post = Post.find(params[:id])
	end





end
