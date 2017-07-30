require 'bundler/setup'
Bundler.require

require_relative "list"

def debug_params
  puts "reload page: #{params}"
end

get "/" do
  # HINT: you can use instance variables in the view directly without passing to locals
  # such as this @title instance variable
  @title = "Sunny TODO"
  #list = List.new("0")
  #list.load_from_file
  lists = List.load_all_lists
  #  lists list  
  #p @files
  erb :"index.html", locals: {lists: lists}, layout: :"layout.html"
end

# UPDATE a list with id from params["id"]
post "/lists/update" do
  debug_params
  puts "delete-list: #{params["delete-list"]}"
  list = List.new(params["id"])
  if ((params["name"] =="" && params["items"]=="") ||(params["name"] =="" && params["save_all"]=="") ) 
    #&& (params["items"]=="" ||params["save_all"]==""))
    puts "we will delete this list!"
    list.delete_list(list.filename)
    redirect back
  end
    # no need to load from file. we will save new contents to file
  list.name = params["name"]
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
# ??? post "/lists/:id/items/add" do
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

post "lists/delete" do
  debug_params
end  

post '/lists/new' do
  debug_params

  files = Dir["./data/*.md"]
  # @files = files.map do |file|
  idlist= 0 
  listids = [] 
  puts files
  files.each do |file|
    listids << file[7].to_i
  end

  listids = listids.sort
  puts listids
  for i in 0..listids.length
    puts idlist  
    if (idlist == listids[i] )
        idlist = idlist + 1
    else
        break
    end    
  end
  list =List.new(idlist)
  list.new_file(idlist,params['list-name'])  
  
  redirect back
end