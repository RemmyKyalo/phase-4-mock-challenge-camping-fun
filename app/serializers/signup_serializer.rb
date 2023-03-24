class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time
  has_one :camper_id
  has_one :activity_id
end
