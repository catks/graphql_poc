Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :criarCargo, function: Resolvers::CriarCargo.new
  field :apagarCargo, function: Resolvers::ApagarCargo.new
  field :atualizarCargo, function: Resolvers::AtualizarCargo.new
end
