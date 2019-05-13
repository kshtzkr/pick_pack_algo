# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Need to run the algorithm in rails console.

for execution

Initalize model method in rails console

@pick_pack = PickPack.new

Now call the method by

Method: pick_pack(picker,package,items)

Example: @pick_pack.pick_pack(1,1,[1,3,6,9])

notes: Items array can't be more than 3 items for now.