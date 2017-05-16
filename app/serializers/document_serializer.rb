class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :admin, if: -> { object.name.nil? }
  has_many :comments


  def admin
    "admin"
  end
end
