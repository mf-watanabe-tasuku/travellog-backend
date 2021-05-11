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
      {
        'id' => 6,
        'title' => 'This is post six title',
        'body' => 'This is post six body.'
      },
      {
        'id' => 7,
        'title' => 'This is post seven title',
        'body' => 'This is post seven body.'
      },
      {
        'id' => 8,
        'title' => 'This is post eight title',
        'body' => 'This is post eight body.'
      },
      {
        'id' => 9,
        'title' => 'This is post nine title',
        'body' => 'This is post nine body.'
      },
      {
        'id' => 10,
        'title' => 'This is post ten title',
        'body' => 'This is post ten body.'
      },
    ]

    render json: posts
  end
end
