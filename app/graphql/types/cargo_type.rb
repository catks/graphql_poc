Types::CargoType = GraphQL::ObjectType.define do
  name 'Cargo'

  field :id, !types.ID
  field :titulo, !types.String
  field :descricao, !types.String
end
