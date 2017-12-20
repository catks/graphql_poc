Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :listarCargos, !types[Types::CargoType] do
    resolve -> (_, _, _) { Cargo.all.order(:id) }
  end
end
