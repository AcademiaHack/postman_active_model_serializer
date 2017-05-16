class Document < ApplicationRecord
  attr_accessor :iva
  has_many :sections
  has_many :paragraphs, through: :sections
  has_many :notifications, as: :notificable
  has_many :comments, as: :commentable
  after_find :set_iva

  private

  def set_iva
    self.iva = 1234
  end
end
