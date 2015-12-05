class VotesController < ApplicationController

  def cast_vote
    cv_resp = {error: nil}
    if @current_user.nil?
      cv_resp[:error] = "You are must be logged in to vote."
    else
      post_id = vote_params[:post_id]
      updown = vote_params[:updown]
      user_id = @current_user.id
      vote = Vote.where(post_id: post_id, user_id: user_id).take
      if vote.nil?
        Vote.create!(post_id: post_id, user_id: user_id, updown_cd: updown)
      else
        if vote.updown_cd != updown.to_i
          vote.destroy
        end
      end
      post = Post.find(post_id)
      cv_resp[:overall_votes] = post.overall_votes
      cv_resp[:vote_casted] = -1;
      vote = Vote.where(post_id: post_id, user_id: user_id).take
      cv_resp[:vote_casted] = vote.updown_cd if vote
      Related.update_relations
      Post.update_trending
    end

    respond_to do |format|
      format.any { render :json => cv_resp }
    end
  end

  private
    def vote_params
      params.permit(:post_id, :updown)
    end
end
