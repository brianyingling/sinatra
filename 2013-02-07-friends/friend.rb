require 'pg'
require 'pry'

class Friend
  def initialize(options={})
    @options = options
  end

  def save
    conn = PG.connect(:dbname=>'friends',:host=>'localhost')
    values = []
    @options.values.each {|value| values << "\'#{value}\'"}
    sql = "insert into friends (#{@options.keys.join(', ')}) values (#{values.join(', ')})"
    conn.exec(sql)
    conn.close
  end

def self.list
    conn = PG.connect(:dbname=>'friends',:host=>'localhost')
    rows =  conn.exec("select * from friends")
    conn.close
    rows
  end
end