# Starter Code

This project provides the start code for you to work on Assignment 3.

If you're using your own project from Assignment 2, please still clone this project and take a look at the code and try to understand it.

A few things you can play with:

## Setting up

- [x] Git clone the project to the computer
- [x] If you're on a Mac, run the app with `shotgun app.rb` then open http://localhost:9393
- [x] If yu're on Windows, run the app with `ruby app.rb` then open http://localhost:4567
- [x] Look at `data/0.md`, add some mock data and reload the browser to make sure it works correctly
- [x] Mark items as Done/Undone on the browser and check `data/0.md`
- [x] Add a few new item to the list on the browser and check `data/0.md`

## Code

- [x] Look at `views/layout.html.erb` and make sure you ask if there's anything unclear.
- [x] Look at `views/index.html.erb` and try to see if you can determine how this file determines what gets displayed on the browser.
- [x] Look at `app.rb` and write down all the possible routes you can identify. Fill in the block below (replace ... with the correct text)

    ```
    GET / to display all items
    POST /...
    POST /...
    ```

- [x] Look at `item.rb` and make sure you can explain its structure. You can type `irb`, then `require_relative "item"` to play with it. See this [screenshot](https://cl.ly/1F1v0p0v1m1y) for some examples.

    ```
    $ irb
    >> require_relative "item"
    >> Item.new("Buy milk")
    ```

- [x] Look at `list.rb` and similarly, understand what accessors are available and what methods are available. Similarly, you can test the `List` class from the code console ([screenshot](https://cl.ly/0h2y0t2Z2m1O))

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
**Required User Stories:**

### Check what's already done in your starting app:

- [x] User can see the list of Todo items on the home page
- [x] The Todo list and items should look similar to Trello Lists and Cards (free free to customize any color)
- [x] User can click a Done button next to an undone item to complete it
- [x] User can click an Undo button next to a done item to undo it

### Check new features

- [X] User can create a new List so that she can maintain more than one list horizontally
- [X] User can cancel the list form after clicking on the "Add a list" text
- [X] User can add a new item by clicking on "Add an item..." and can click Cancel if desired
- [X] User can drag to re-order items in a list and the list saves automatically
- [X] User can drag an item from one list to another and both lists save automatically

**Optional User Stories:**

- [X] User can rename a list. For example “Today” to “Inbox”
- [X] User can delete an item
- [ ] User can delete a list ( I am Sorry I got bug)
- [X] User can rename the current's list's name

**Additional User Stories:**

Feel free to add any more enhancements that you made here.
