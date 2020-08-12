require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
            SQL
        db.execute(sql, name, type) 
        # need to pass through 'db' as only Instance knows about it, not Class
    end

    def update
        sql = <<-SQL
            UPDATE pokemon
            SET name = ?, type = ?
            WHERE id = ?
            SQL
            db.execute(sql, self.name, self.type, self.id)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
        SQL

        row = db.execute(sql, id)[0] #still confused as to why sql shoots back a double array "[[stuff]]""
        id = row[0]
        name = row[1]
        type = row[2]
        Pokemon.new(id: id, name: name, type: type, db: db)
    end


end
