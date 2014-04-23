require_relative './settings'
require 'sqlite3'
require_relative './models/person'

module Rubb
    class Data
        @@db = "#{Rubb::PROJROOT}/data/db.db"

        def self.create_tables
            db = SQLite3::Database.new @@db
            db.execute <<-SQL
                CREATE TABLE People (
                    id INT,
                    name TEXT
                )
SQL
        end

        def self.add_sample
            db = SQLite3::Database.new @@db
            db.execute "INSERT INTO People (id, name) VALUES (1, 'Sam Winter')"
        end

        def self.get_all
            db = SQLite3::Database.new @@db
            rslts = db.execute "SELECT * FROM People"
            people = []
            rslts.each do |row|
                p = Person.new
                p.id = row[0]
                p.name = row[1]
                people.push(p)
            end
            people
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