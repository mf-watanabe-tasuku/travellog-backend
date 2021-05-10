class Api::V1::PostsController < ApplicationController
  def index
    post = { 'title' => 'This is post title.', 'body' => 'This is post body.'}

    render :json => post
  end
end
