
require 'rails'
require 'rails/generators'
require 'rails/generators/migration'
require 'pg'

require "active_record/postgresql/uuid/version"

module ActiveRecord
  module PostgreSQL
    class UUIDColumn < Rails::Railtie

      initializer 'activerecord-postgres-uuid' do
        ActiveSupport.on_load :active_record do
          require "active_record/connection_adapter_with_uuid"
        end
      end

      # Creates the hstore:setup generator. This generator creates a migration that
      # adds hstore support for your database. If fact, it's just the sql from the
      # contrib inside a migration. But it' s handy, isn't it?
      #
      # To use your generator, simply run it in your project:
      #
      #   rails g hstore:setup
      class Setup < Rails::Generators::Base
        include Rails::Generators::Migration

        def self.source_root
          @source_root ||= File.join(File.dirname(__FILE__), 'templates')
        end

        def self.next_migration_number(dirname)
          if ActiveRecord::Base.timestamped_migrations
            Time.now.utc.strftime("%Y%m%d%H%M%S")
          else
            "%.3d" % (current_migration_number(dirname) + 1)
          end
        end

        def create_migration_file
          pgversion = ActiveRecord::Base.connection.send(:postgresql_version)
          if pgversion < 90100
            raise RuntimeError, "UUID is not supported on Postgress < 9.1"
          else
            migration_template 'setup_uuid_91.rb', 'db/migrate/setup_uuid.rb'
          end
        end
      end
    end
  end
end
