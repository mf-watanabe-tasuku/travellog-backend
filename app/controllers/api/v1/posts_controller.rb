class Api::V1::PostsController < ApplicationController
  def index
    limit = request.query_parameters['limit']

    if limit
      posts = Post.order(created_at: :desc).limit(limit)
    else
      posts = Post.order(created_at: :desc)
    end

    render json: { status: :ok, message: 'Posts Loaded', data: posts }
  end
  
  def show
    post = Post.find(params[:id])
    render json: { status: :ok, message: 'Post Loaded', data: post }
  end
end