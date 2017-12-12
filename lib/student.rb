# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]

class Student
  attr_accessor :name, :grade
  attr_reader :id
  @@all = []


  def initialize (name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id

    @@all << self
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade  INTEGER
      )
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute()
  end

  def self.create
  end

  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, @name, @grade)
  end

end
