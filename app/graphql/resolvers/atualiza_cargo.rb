class Resolvers::AtualizaCargo < GraphQL::Function
  # arguments passed as "args"
  argument :id,     !types.ID
  argument :titulo, !types.String
  argument :descricao, !types.String

  # return type from the mutation
  type Types::CargoType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    result = DB::Cargo::Atualizar.call(
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
