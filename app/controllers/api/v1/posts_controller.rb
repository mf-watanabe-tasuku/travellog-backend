class Api::V1::PostsController < ApplicationController
  def index
    limit = request.query_parameters['limit']

    if limit
      posts = Post.order(created_at: :desc).limit(limit)
    else
      posts = Post.order(created_at: :desc)
    end

    render json: { status: :ok, data: posts }
  end

  def show
    post = Post.find(params[:id])
    render json: { status: :ok, data: post }
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: { status: :ok, data: post }
    else
      render json: { status: 500, data: post.errors }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end