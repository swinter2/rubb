require 'sqlite3'
require './models/person'

module Rubb
    class Data
        @@db = "../../data/db.db"

        def self.create_tables
            db = SQLite3::Database.new @@db
            db.execute <<-SQL
                CREATE TABLE People (
                    id INT,
                    name TEXT
                )
SQL
        end

        def self.get_person(id)
            db = SQLite3::Database.new @@db
            rslt = db.execute "SELECT * FROM People WHERE id = ?", id
            p = Person.new
            rslt.each do |row|
                p.id = row[0]
                p.name = row[1]
            end
        end
    end
end