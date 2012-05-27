# UuidSupport

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-postgres-uuid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-postgres-uuid

### Note for Rails 3.1 and Above

You'll also need to install `activerecord-postgres-hstore`:

    gem "activerecord-postgres-hstore", git: "git://github.com/softa/activerecord-postgres-hstore.git"

Referencing the master branch of `activerecord-postgres-hstore` should
only be neccissary until it hits version `0.4.0`.

## Usage

Once the gem is installed you can start safely referencing UUID column
types in your migrations:

    class CreatePayments < ActiveRecord::Migration
      def change
        create_table :payments do |t|
          t.uuid :uuid
          t.integer :amount

          t.timestamps
        end
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
