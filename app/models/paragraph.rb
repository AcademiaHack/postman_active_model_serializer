class Paragraph < ApplicationRecord
  belongs_to :section
  has_many :comments, as: :commentable
end
