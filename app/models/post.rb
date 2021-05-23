class Post < ApplicationRecord
  has_one :eyecatch, dependent: :destroy

  attribute :eyecatchId, :string
  attribute :eyecatchUrl, :string
end