# frozen_string_literal: true

class Admin::Api::PostsController < Admin::ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      head :no_content
    else
      render json: {
        errors: post.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :content_html,
      :content_css
    )
  end
end
