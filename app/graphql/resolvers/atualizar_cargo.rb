class Resolvers::AtualizarCargo < GraphQL::Function
  argument :id,     !types.ID
  argument :titulo, !types.String
  argument :descricao, !types.String

  type Types::CargoType

  def call(_obj, args, _ctx)
    result = Repo::Cargo::Atualizar.call(
      id: args[:id],
      titulo: args[:titulo],
      descricao: args[:descricao],
    )

    if result.success?
      result.cargo
    else
      GraphQL::ExecutionError.new(result.error)
    end
  end
end
