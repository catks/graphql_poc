class Resolvers::CriarCargo < GraphQL::Function
  # arguments passed as "args"
  argument :titulo, !types.String
  argument :descricao, !types.String

  # return type from the mutation
  type Types::CargoType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Cargo.create!(
      titulo: args[:titulo],
      descricao: args[:descricao]
    )
  end
end
