Types::PerguntaType = GraphQL::ObjectType.define do
  name 'Pergunta'

  field :id, !types.ID
  field :titulo, !types.String
  field :cargo, !types[Types::CargoType]
end
