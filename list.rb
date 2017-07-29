
require_relative "item"

class List
  attr_reader :lines
  attr_accessor :items, :name, :id
  
  def initialize(id)
    @id = id
    @lines = []
    @items = []
  end

  def self.load_all
    files = Dir["data/*.md"]
    lists = []
    files.each do |e|
      #e = e[-4]
      e = e.split("/")[1].split(".")[0]
      list = List.new(e)
      list.load_from_file
      lists << list
    end
    lists
  end

  def load_from_file
    @lines = File.read(filename).split("\n")
    @name = @lines.shift # get the first line to be the List name
    @items = @lines.map.with_index {|line, index| Item.new_from_line(line, index)}
  end

  def filename
    "data/#{id}.md"
  end

  def toggle_item(name)
    puts "Finding |#{name}|"
    item = items.find{|e| e.name == name}
    if item
      item.toggle!
    else
      puts "item not found: #{name}"
    end
  end

  def add(name)
    self.items << Item.new(name)
  end

  def save!
    lines = [name] + @items.map(&:display_line)
    File.write(filename, lines.join("\n"))
  end
end