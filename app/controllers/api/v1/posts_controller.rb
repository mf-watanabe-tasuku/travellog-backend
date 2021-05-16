class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [ :show, :update, :destroy ]

  def index
    limit = request.query_parameters['limit']
    start = request.query_parameters['start']

    posts = Post.order(created_at: :desc).limit(limit).offset(start)

    render json: { status: :ok, data: posts }
  end

  def count
    count = Post.all.count
    render json: { status: :ok, data: count}
  end

  def show
    eyecatch = Eyecatch.where(post_id: @post.id).last

    result = {
      post: @post,
      image: eyecatch ? eyecatch['image'] : "https://res.cloudinary.com/dnzkxyfdv/image/upload/v1621204014/travellog/sample.jpg"
    }

    render json: { status: :ok, data: result }
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