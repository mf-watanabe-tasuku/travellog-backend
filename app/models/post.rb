class Post < ApplicationRecord
  has_one :eyecatch, dependent: :destroy

  attribute :image, :string
end