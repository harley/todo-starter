class Item
  attr_reader :name
  attr_accessor :index

  def initialize(name, done = false)
    @name = name
    @done = done
  end

  def done?
    @done
  end

  def status
    done? ? 'done' : 'undone'
  end

  def display_line
    if done?
      '- [x] ' + name
    else
      '- [ ] ' + name
    end
  end

  def toggle!
    @done = !@done
  end

  def self.new_from_line(line, index)
    item = new(line[6..-1], line[3] == 'x')
    item.index = index
    item
  end
end