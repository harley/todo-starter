# Starter Code

This project provides the start code for you to work on Assignment 3.

If you're using your own project from Assignment 2, please still clone this project and take a look at the code and try to understand it.

A few things you can play with:

## Setting up

- [ ] Git clone the project to the computer
- [ ] If you're on a Mac, run the app with `shotgun app.rb` then open http://localhost:9393
- [ ] If yu're on Windows, run the app with `ruby app.rb` then open http://localhost:4567
- [ ] Look at `data/0.md`, add some mock data and reload the browser to make sure it works correctly
- [ ] Mark items as Done/Undone on the browser and check `data/0.md`
- [ ] Add a few new item to the list on the browser and check `data/0.md`

## Code

- [ ] Look at `views/layout.html.erb` and make sure you ask if there's anything unclear.
- [ ] Look at `views/index.html.erb` and try to see if you can determine how this file determines what gets displayed on the browser.
- [ ] Look at `app.rb` and write down all the possible routes you can identify. Fill in the block below (replace ... with the correct text)

    ```
    GET / to display all items
    POST /...
    POST /...
    ```

- [ ] Look at `item.rb` and make sure you can explain its structure. You can type `irb`, then `require_relative "item"` to play with it. See this [screenshot](https://cl.ly/1F1v0p0v1m1y) for some examples.

    ```
    $ irb
    >> require_relative "item"
    >> Item.new("Buy milk")
    ```

- [ ] Look at `list.rb` and similarly, understand what accessors are available and what methods are available. Similarly, you can test the `List` class from the code console ([screenshot](https://cl.ly/0h2y0t2Z2m1O))

    ```
    >> require_relative "list" #=> true
    >> List.new(0) #=> #<List:0x007fcebb85cb40 @id=0, @lines=[], @items=[]>
    >> List.new(1) #=> #<List:0x007fcebd0e02c0 @id=1, @lines=[], @items=[]>
    >> list = List.new(0) #=> #<List:0x007fcebd0b0a48 @id=0, @lines=[], @items=[]>
    >> list.load_from_file
    >> list.filename #=> "data/0.md"
    >> list.name #=> "Today 😇"
    >> list.items #=> <an array of Item objects>
    >> list.items.map {|e| e.display_line} #=> <an array of strings>
    ```

## Improvements

See the [Assignment 3](http://learning.coderschool.vn/courses/_bootcamp_ruby/unit/3#!assignment) page for the list of items you can work on. Rename this file to `NOTES.md` and create a new `README.md` file with the user stories listed there (and mark the ones completed).