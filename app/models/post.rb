class Post < ApplicationRecord
  has_one :eyecatch, dependent: :destroy

  attribute :image, :string
  attribute :eyecatchId, :string
  attribute :eyecatchUrl, :string
end