class Resolvers::CargoPalavrasRelacionadas < GraphQL::Function
  complexity 1

  argument :limit, types.Int, default_value: 10

  type Types::CargoType

  def call(_obj, args, _ctx)
    palavras = %w[empolgante maneiro legal supimpa]
    Array.new(10) { palavras.sample }.take(args[:limit])
  end
end
