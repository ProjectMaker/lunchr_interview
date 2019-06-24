class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :name, :updated_at, :created_at, :source_type
end
