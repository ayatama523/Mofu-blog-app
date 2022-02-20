# frozen_string_literal: true

class Admin::PostsController < Admin::ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index]

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @no_container = true
  end
end
