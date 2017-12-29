Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :listarCargos, !types[Types::CargoType], complexity: 7 do
    resolve -> (_, _, _) { Cargo.all.order(:id) }
  end

  field :buscarCargo, function: Resolvers::BuscarCargo.new

  field :sleep, !types.Int do
    description 'Espera por alguns segundos'

    argument :seconds, !types.Int

    resolve -> (_,args,_) {
      sleep(args[:seconds])
      args[:seconds]
    }
  end

  field :sleep_async, !types.Int do
    description 'Espera por alguns segundos de forma assíncrona'

    argument :seconds, !types.Int

    resolve -> (_,args,_) {
      Concurrent::Future.execute do
        sleep(args[:seconds])
        args[:seconds]
      end
    }
  end
end
