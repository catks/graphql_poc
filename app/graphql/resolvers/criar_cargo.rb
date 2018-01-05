class Resolvers::CriarCargo < GraphQL::Function
  argument :titulo, !types.String
  argument :descricao, !types.String

  type Types::CargoType

  def call(_obj, args, _ctx)
    Cargo.create!(
      titulo: args[:titulo],
      descricao: args[:descricao]
    )
  end
end
