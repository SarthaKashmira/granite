# frozen_string_literal: true

ActiveRecord::ConnectionAdapters::SQLite3Adapter.class_eval do
  alias_method :orig_initialize, :initialize

  if defined?(ActiveRecord::ConnectionAdapters::SQLite3Adapter)
    def initialize(*args)
      orig_initialize(*args)

      # is_sqlite_db = ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] == "sqlite3"

      raw_connection.create_function("regexp", 2) do |fn, pattern, expr|
        regex_matcher = Regexp.new(pattern.to_s, Regexp::IGNORECASE)
        fn.result = expr.to_s.match(regex_matcher) ? 1 : 0
      end
    end
  end
end
