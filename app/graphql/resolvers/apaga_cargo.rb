class Resolvers::ApagaCargo < GraphQL::Function
  # arguments passed as "args"
  argument :id, !types.ID

  # return type from the mutation
  type Types::CargoType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, ctx)
    result = ApagarCargo.call(id: args[:id], auth_token: ctx[:auth_token].to_s)

    if result.success?
      result.cargo
    else
      GraphQL::ExecutionError.new(result.error)
    end
  end
end
