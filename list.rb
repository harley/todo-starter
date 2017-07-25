require_relative "item"

class List
  attr_reader :lines
  attr_accessor :items
  
  def initialize(filename = "todo.md", sort = nil)
    @filename = filename
    @sort = sort
    @lines = File.read(filename).split("\n")
    @items = @lines.map.with_index {|line, index| Item.new_from_line(line, index)}
  end

  def toggle_item(name)
    puts "finding |#{name}|"
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
    File.write(@filename, @items.map(&:display_line).join("\n"))
  end

  def sorted_items
    case @sort
    when "asc"
      items.sort_by(&:name)
    when "desc"
      items.sort_by(&:name).reverse
    when "done"
      items.sort_by {|e| e.done? ? 1 : 0}
    else
      items
    end
  end
end