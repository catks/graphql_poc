GraphqlPocSchema = GraphQL::Schema.define do
  max_complexity 300

  mutation(Types::MutationType)
  query(Types::QueryType)

  lazy_resolve(Concurrent::Future, :value)
end
