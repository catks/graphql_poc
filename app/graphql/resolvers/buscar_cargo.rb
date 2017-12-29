class Resolvers::BuscarCargo < GraphQL::Function
  complexity 3
  # arguments passed as "args"
  argument :id, !types.ID

  # return type from the mutation
  type Types::CargoType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Cargo.find(args[:id])
  end
end
