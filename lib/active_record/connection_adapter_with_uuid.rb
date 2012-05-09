module ActiveRecord
  module ConnectionAdapters

    class TableDefinition

      # Adds hstore type for migrations. So you can add columns to a table like:
      #   create_table :people, :id => false do |t|
      #     ...
      #     t.uuid :id, :null => false
      #     ...
      #   end
      def uuid(*args)
        options = args.extract_options!
        column_names = args
        column_names.each { |name| column(name, 'uuid', options) }
      end

    end

    class PostgreSQLColumn < Column

      # Adds the uuid type for the column.
      def simplified_type_with_uuid(field_type)
        field_type == 'uuid' ? :uuid : simplified_type_without_uuid(field_type)
      end

      alias_method_chain :simplified_type, :uuid
    end

    class PostgreSQLAdapter < AbstractAdapter
      def native_database_types_with_uuid
        native_database_types_without_hstore.merge({:uuid => { :name => "uuid" }})
      end

      alias_method_chain :native_database_types, :uuid
    end
  end
end
