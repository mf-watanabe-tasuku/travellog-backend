class Post < ApplicationRecord
  has_one :eyecatch, dependent: :destroy
end