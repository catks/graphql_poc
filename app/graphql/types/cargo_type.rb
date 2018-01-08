Types::CargoType = GraphQL::ObjectType.define do
  name 'Cargo'

  field :id, !types.ID
  field :titulo, !types.String
  field :descricao, !types.String
  field :perguntas, types[Types::PerguntaType]
  connection :perguntasConnection, Types::PerguntaType.connection_type, property: :perguntas

  field :palavras_relacionadas, types[types.String],
        function: Resolvers::CargoPalavrasRelacionadas.new

  field :formacoes, types[types.String],
        function: Resolvers::CargoFormacoes.new
end
