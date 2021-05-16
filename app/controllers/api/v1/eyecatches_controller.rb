class Api::V1::EyecatchesController < ApplicationController
  before_action :eyecatch_upload

  def create
    eyecatch = Eyecatch.new(post_id: params[:refId], image: @res['secure_url'])

    if eyecatch.save
      render json: { status: :ok, data: eyecatch }
    else
      render json: { status: 500, data: eyecatch.errors }
    end
  end

  def update
    eyecatch = Eyecatch.find_by(post_id: params[:refId])

    if eyecatch.update(image: @res['secure_url'])
      render json: { status: :ok, data: eyecatch }
    else
      render json: { status: 500, data: eyecatch.errors }
    end
  end

  private

  def eyecatch_upload
    @res = Cloudinary::Uploader.upload(
      params[:files],
      :folder => "travellog",
      :public_id => "eyecatch_" + params[:refId]
    )
  end
end
