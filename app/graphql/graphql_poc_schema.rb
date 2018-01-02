GraphqlPocSchema = GraphQL::Schema.define do
  max_complexity 300

  mutation(Types::MutationType)
  query(Types::QueryType)

  lazy_resolve(Concurrent::Future, :value)

  #Instrumentation

  instrument(:query, Instrumentation::QueryTimerInstrumentation)
end

GraphqlPocSchema.query_analyzers << GraphQL::Analysis::QueryComplexity.new do |query, complexity|
  Rails.logger.info("Complexity: #{complexity}")
end
