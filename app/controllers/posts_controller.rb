class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(params.permit(:category_id)).order('trending DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_title = @post.title
    @comment = Comment.new()
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if @current_user == nil || @current_user.id != @post.user_id
      redirect_to post_path id:@post.id
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    if @current_user != nil
      @post = Post.new(post_params)
      #Can also look into the build method
      @post.user_id = @current_user.id
  
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to @post
      else
        render :new
      end
    else
      flash[:notice] = 'Login to create a new post.'
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @current_user != nil && @current_user.id == @post.user_id
      respond_to do |format|
        #might have to add user ID
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @current_user != nil && @current_user.id == @post.user_id
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Must be your post inorder to destroy it.' }
        format.json { head :no_content }
      end
    end
  end
  
  def search
    if params[:search_terms] != "" && params[:search_terms] != nil
      @posts = Array.new()
      Post.order('trending DESC').all.each do |pst|
        if pst.title.downcase.include?(params[:search_terms].downcase) || pst.body.downcase.include?(params[:search_terms].downcase)
          @posts.push pst
        end
      end
    else
      @posts = Post.order('trending DESC').all
      flash[:notice] = "No posts were found"
      render :index
    end
    
    if @posts == nil || @posts.empty?
      @posts = Post.order('trending DESC').all
      flash[:notice] = "No posts were found"
      render :index
    end
  end
  
  def flagpost
    @post = Post.find(params[:id])
    @post.flagpost=true
    @post.save
     flash[:success] = "post was flagged"
   redirect_to post_path id:@post.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
       @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :thumbnail, :user_id)
    end
end
