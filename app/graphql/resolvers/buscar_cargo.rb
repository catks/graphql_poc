class Resolvers::BuscarCargo < GraphQL::Function
  complexity 3

  argument :id, !types.ID

  type Types::CargoType

  def call(_obj, args, _ctx)
    Cargo.find(args[:id])
  end
end
