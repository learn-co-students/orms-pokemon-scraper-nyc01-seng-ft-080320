class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize (id: nil, name:, type:, db: nil)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        db.execute("SELECT last_insert_rowid() FROM pokemon")
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL
        pokemon_arr = db.execute(sql, id)
        #binding.pry
        self.new(id: pokemon_arr[0][0], name: pokemon_arr[0][1], type: pokemon_arr[0][2])
    end
end
