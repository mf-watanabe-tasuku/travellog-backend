class Api::V1::PostsController < ApplicationController
  def index
    posts = [
      {
        'id' => 1,
        'title' => 'This is post one title',
        'body' => 'This is post one body.'
      },
      {
        'id' => 2,
        'title' => 'This is post two title',
        'body' => 'This is post two body.'
      },
      {
        'id' => 3,
        'title' => 'This is post three title',
        'body' => 'This is post three body.'
      },
      {
        'id' => 4,
        'title' => 'This is post four title',
        'body' => 'This is post four body.'
      },
      {
        'id' => 5,
        'title' => 'This is post five title',
        'body' => 'This is post five body.'
      },
    ]

    render json: posts
  end
end
