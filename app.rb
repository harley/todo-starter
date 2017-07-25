require 'bundler/setup'
Bundler.require

require_relative "list"

get "/" do
  list = List.new("todo.md", params["sort"])
  erb :"index.html", locals: {items: list.sorted_items, sort: params["sort"]}, layout: :"layout.html"
end

post "/update-all" do
  puts "Params: #{params}"
  list = List.new

  items = params["items"].map do |item_hash|
    puts "item_hash: #{item_hash}"
    Item.new(item_hash["name"], item_hash["status"] == "done")
  end
  list.items = items

  if params["toggle"]
    puts "Toggle: #{params["toggle"]}"
    list.toggle_item(params["toggle"])
  end

  list.save!
  redirect back
end

post "/add" do
  list = List.new
  puts "Creating item #{params['name']}"
  if params["name"]
    list.add(params["name"])
    list.save!
  end
  redirect back
end