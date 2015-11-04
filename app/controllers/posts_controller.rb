class PostsController < ApplicationController
    #before_filter :set_current_user
    #before_filter :has_user, :only => [:new, :create]
    
    def post_params
        #want to include: title, images, text, links, and videos
        #type will be a link, video, image?
        #work on migrations and post model
        #class < MigrationController - figure out what that does
        #should require a user to be logged in to post - should redirect if not logged in
        #Possibly permit user_id
        params.require(:posts).permit(:title, :text)
    end
    
    #protected
    def has_user
        unless @current_user
            flash[:warning] = 'You must be logged in to create a post.'
            redirect_to login_path
        end
    end
    
    def new
        # default: render 'new' template
    end
  
    def create
        @post = Post.create!(post_params)
        flash[:notice] = "#{@post.title} was successfully created."
        redirect_to posts_path
    end
    
    def index
        @posts = Post.all
    end
    
    def edit
        @post = Post.find params[:id]
    end
    
    def show
        id = params[:id] # retrieve post ID from URI route
        @post = Post.find(id) # look up post by unique ID
    end
    
    def update
        @post = Post.find params[:id]
        @post.update_attributes!(post_params)
        flash[:notice] = "#{@post.title} was successfully updated."
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "Post '#{@post.title}' deleted."
        redirect_to posts_path
    end
  
end