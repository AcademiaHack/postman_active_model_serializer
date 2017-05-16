class Section < ApplicationRecord
  belongs_to :document
  has_many :paragraphs
  has_many :comments, as: :commentable
end
