class Api::V1::PostsController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, except: [ :index, :show, :count ]
  before_action :set_post, only: [ :show, :update, :destroy ]

  def index
    limit = request.query_parameters['limit']
    start = request.query_parameters['start']

    posts = Post.order(created_at: :desc).limit(limit).offset(start)
    posts.each { |post| post.image = post.eyecatch['image'] if post.eyecatch }

    render json: { status: "SUCCESS", message: "Loaded posts", data: posts }, status: :ok
  end

  def count
    count = Post.all.count
    render json: { status: "SUCCESS", message: "Loaded post count", data: count }, status: :ok
  end

  def show
    if @post.eyecatch
      @post.eyecatchId = @post.eyecatch['id']
      @post.eyecatchUrl = @post.eyecatch['image']
    end

    render json: { status: "SUCCESS", message: "Loaded post", data: @post }, status: :ok
  end

  def create
    post = Post.new(post_params)

    if post.save
      p post
      render json: { status: "SUCCESS", message: "Saved post", data: post }, status: :ok
    else
      render json: { status: "ERROR", message: "Post not saved", data: post.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { stauts: "SUCCESS", message: 'Updated post', data: @post}, status: :ok
    else
      render json: { status: "ERROR", message: 'Update failed', data: @post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.delete
    render json: { status: "SUCCESS", message: "Post deleted" }, status: :ok
  end

  private

  def post_params
    params.permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end