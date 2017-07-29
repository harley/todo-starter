
require 'bundler/setup'
Bundler.require

require_relative "list"

def debug_params
  puts "PARAMS: #{params}"
end

get "/" do
  # HINT: you can use instance variables in the view directly without passing to locals
  # such as this @title instance variable
  @title = "Trolo"
  lists = List.load_all

  erb :"index.html", locals: {lists:lists}, layout: :"layout.html"
end

# UPDATE a list with id from params["id"]
post "/lists/update" do
  debug_params

  list = List.new(params["id"])
  list.name = params["name"]
  # no need to load from file. we will save new contents to file

  items = params["items"].map do |item_hash|
    puts "creating Item from item_hash: #{item_hash}"
    Item.new(item_hash["name"], item_hash["status"])
  end
  list.items = items

  if params["toggle"]
    puts "Toggle: #{params["toggle"]}"
    list.toggle_item(params["toggle"])
  end
  list.save!
  redirect back
end

post "/lists/:id/items/add" do
  debug_params

  list = List.new(params["id"])
  list.load_from_file
  puts "Creating item #{params['name']} for list #{params['id']}"
  if params["name"]
    list.add(params["name"])
    list.save!
  end
  redirect back
end

#----------------- Add New List ------------------

post "/newlist/name" do
  new_list = List.new("#{params[:id]}")
  new_list.name = "#{params[:id]}" 
  new_list.save!
  List.new("#{new_list.name}")
  #new_list.filename
  
  redirect back
end





#----------------Time Setter--------------------

time = Time.new()
@today = "#{time.day}/#{time.month}/#{time.year}"








