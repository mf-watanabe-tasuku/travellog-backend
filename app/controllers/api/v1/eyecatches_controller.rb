class Api::V1::EyecatchesController < ApplicationController
  def create
    res = Cloudinary::Uploader.upload(
      params[:files],
      :folder => "travellog",
      :public_id => "eyecatch_" + params[:refId]
    )

    eyecatch = Eyecatch.new(post_id: params[:refId], image: res['secure_url'])

    if eyecatch.save
      render json: { status: :ok, data: eyecatch }
    else
      render json: { status: 500, data: eyecatch.errors }
    end
  end
end
