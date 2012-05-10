# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_record/postgresql/uuid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ivan Vanderbyl"]
  gem.email         = ["ivanvanderbyl@me.com"]
  gem.description   = %q{Adds the UUID column type to ActiveRecord PostgreSQL Adapter}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "activerecord-postgres-uuid"
  gem.require_paths = ["lib"]
  gem.version       = ActiveRecord::PostgreSQL::UUIDColumn::VERSION

  gem.add_dependency "activerecord", ">= 3.1.0"
  gem.add_dependency "pg", ">= 0.12.0"
end
