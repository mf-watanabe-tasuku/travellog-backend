class Api::V1::EyecatchesController < ApplicationController
  def create
    result = Cloudinary::Uploader.upload(params[:files])
    eyecatch = Eyecatch.create(post_id: params[:refId], image: result['filename'])

    if eyecatch.save
      render json: { status: :ok, data: eyecatch }
    else
      render json: { status: 500, data: eyecatch.errors }
    end
  end
end
