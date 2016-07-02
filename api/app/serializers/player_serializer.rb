class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :gamesList, :country, :photo
end
