class Resolvers::ApagarCargo < GraphQL::Function
  argument :id, !types.ID

  type types.Boolean

  def call(_obj, args, ctx)
    result = ::ApagarCargo.call(id: args[:id], auth_token: ctx[:auth_token].to_s)

    if result.success?
      result.success?
    else
      GraphQL::ExecutionError.new(result.error)
    end
  end
end
