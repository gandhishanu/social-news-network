class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    if @current_user.nil?
      flash[:warning] = "You must be logged in to post a comment."
      return redirect_to post_path id: comment_params[:post_id]
    end

    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id;

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(id: comment_params[:post_id]), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        flash[:warning] = "Cannot post blank comment."
        format.html { redirect_to post_path id: comment_params[:post_id] }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @current_user.nil?
      flash[:warning] = "You must be logged in to update your comments."
      return redirect_to post_path(id: comment_params[:post_id])
    end

    if @comment.user_id != @current_user.id
      flash[:warning] = "You can only update your own comments."
      return redirect_to post_path(id: comment_params[:post_id])
    end

    respond_to do |format|
      if @comment.update(body: comment_params[:body])
        format.html { redirect_to post_path(id: comment_params[:post_id]), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        flash[:warning] = 'Cannot make the comment blank.';
        format.html { redirect_to post_path(id: comment_params[:post_id])}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @current_user.nil?
      flash[:warning] = "You must be logged in to delete your comments."
      return redirect_to post_path(id: @comment.post_id)
    end

    if @comment.user_id != @current_user.id
      flash[:warning] = "You can only delete your own comments."
      return redirect_to post_path(id: @comment.post_id)
    end

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(id: @comment.post_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :comment_id)
    end
end
