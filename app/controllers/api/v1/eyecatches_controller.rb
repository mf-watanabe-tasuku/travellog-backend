class Api::V1::EyecatchesController < ApplicationController
  def create
    @res = Cloudinary::Uploader.upload(
      params[:files],
      :folder => "travellog",
      :public_id => "eyecatch_" + params[:refId]
    )

    post = Post.find(params[:refId])
    eyecatch = post.build_eyecatch(image: @res['secure_url'])

    if eyecatch.save
      render json: { status: :ok, data: eyecatch }
    else
      render json: { status: 500, data: eyecatch.errors }
    end
  end

  def destroy
    eyecatch = Eyecatch.find(params[:id])
    eyecatch.delete
    render json: { status: :ok }
  end
end
