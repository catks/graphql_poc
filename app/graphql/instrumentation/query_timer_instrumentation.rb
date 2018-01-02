module Instrumentation
  module QueryTimerInstrumentation
    module_function

    def before_query(query)
      Rails.logger.info("Query begin: #{Time.now}")
      Thread.current[:query_execution_start] = Time.now
    end

    def after_query(query)
      start_time = Thread.current[:query_execution_start]
      seconds_to_execute = Time.now - Thread.current[:query_execution_start]
      Rails.logger.info("Query end: #{Time.now} took #{seconds_to_execute} seconds to execute")
    end
  end
end
