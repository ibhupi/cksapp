class LocationSerializer < ActiveModel::Serializer
  attributes :id, :title, :lattitude, :longitude, :description, :ranking, :photo
end
