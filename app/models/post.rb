class Post < ApplicationRecord
  has_one :eyecatch, dependent: :destroy
  belongs_to :user

  attribute :eyecatchId, :string
  attribute :eyecatchUrl, :string
end