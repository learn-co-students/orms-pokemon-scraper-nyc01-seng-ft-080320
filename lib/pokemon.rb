require 'pry'

# class Pokemon
#     attr_accessor :name, :type
#     attr_reader :id, :db
    
#     def initialize(name:,type:, db:, id: nil)
#         @name = name
#         @type = type
#         @db = db
#         @id = id
#     end

#     def self.save(name,type,db)
#         # binding.pry
#         sql = <<-SQL
#         INSERT INTO pokemon(name,type) VALUES (?,?)
#         SQL
#         db.execute(sql, name, type)
#         obtain_id = ("SELECT last_insert_rowid() FROM pokemon")
#         @id =db.execute(obtain_id).first
#         self
#     end

#     def self.find(id_of_row,db)
#         sql = <<-SQL
#         SELECT *
#         FROM pokemon
#         WHERE
#         id = ?
#         SQL
#         row = db.execute(sql,id_of_row).first
#         id = row[0]
#         name = row[1]
#         type = row[2]
#         new_pokemon = Pokemon.new(name: name,type: type,db: db,id: id)
#         new_pokemon
    end
end
