class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [ :show, :update, :destroy ]

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
    render json: { status: :ok, data: @post }
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: { status: :ok, data: post }
    else
      render json: { status: 500, data: post.errors }
    end
  end

  def update
    if @post.update(post_params)
      render json: { status: :ok, message: 'Updated the post', data: @post}
    else
      render json: { status: 500, message: 'Not updated', data: @post.errors }
    end
  end

  def destroy
    @post.delete
    render json: { status: :ok }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end