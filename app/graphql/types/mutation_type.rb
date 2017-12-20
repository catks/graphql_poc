Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :criaCargo, function: Resolvers::CriaCargo.new
  field :apagaCargo, function: Resolvers::ApagaCargo.new
end
