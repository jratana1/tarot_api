class CardSerializer
  include JSONAPI::Serializer
  attributes :name, :summary, :upright, :reversed, :created_at
end
