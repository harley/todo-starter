require_relative "item"

class List
  attr_reader :lines
  attr_accessor :items, :name
  
  def initialize(filename = "todo.md")
    @filename = filename
    @lines = File.read(filename).split("\n")
    @name = @lines.shift # get the first line to be the List name
    @items = @lines.map.with_index {|line, index| Item.new_from_line(line, index)}
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
    @items << Item.new(name.capitalize)
  end

  def save!
    lines = [name] + @items.map(&:display_line)
    File.write(@filename, lines.join("\n"))
  end
end