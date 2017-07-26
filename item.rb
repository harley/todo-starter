class Item
  attr_accessor :name, :status, :index

  def initialize(name, status = "undone", index = nil)
    self.name = name
    self.status = status
    self.index = index
  end

  def done?
    status == "done"
  end

  def display_line
    if done?
      '- [x] ' + name
    else
      '- [ ] ' + name
    end
  end

  def toggle!
    if status == "done"
      self.status = "undone"
    else 
      self.status = "done"
    end
  end

  # returns a new item based on a line of text
  def self.new_from_line(line, index = nil)
    status = line[3] == 'x' ? "done" : "undone"
    new(line[6..-1], status, index)
  end
end