class ReadingSerializer
  include JSONAPI::Serializer
  attributes :question, :notes
  # has_many :cards
end
