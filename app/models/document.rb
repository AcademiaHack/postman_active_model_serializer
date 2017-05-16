class Document < ApplicationRecord
  has_many :sections
  has_many :paragraphs, through: :sections
  has_many :notifications, as: :notificable
  has_many :comments, as: :commentable
end
