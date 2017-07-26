require 'bundler/setup'
Bundler.require

require_relative "list"

def debug_params
  puts "PARAMS: #{params}"
end

get "/" do
  @title = "Your App Name"
  list = List.new("todo.md")
  erb :"index.html", locals: {list: list}, layout: :"layout.html"
end

post "/update-all" do
  debug_params

  list = List.new

  items = params["items"].map do |item_hash|
    puts "creating Item from item_hash: #{item_hash}"
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
  debug_params

  list = List.new
  puts "Creating item #{params['name']}"
  if params["name"]
    list.add(params["name"])
    list.save!
  end
  redirect back
end