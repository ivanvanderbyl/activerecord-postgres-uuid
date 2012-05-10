require 'rails'

module ActiveRecord
  module PostgreSQL
    class UUIDColumn < Rails::Railtie
      VERSION = "0.0.1"
    end
  end
end
