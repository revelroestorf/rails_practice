# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create([{title: "worms", img_url: "1", author_id: 1, created_at: "2018-04-16 05:06:09",
  updated_at: "2018-04-18 06:19:14", rating: 2, price: 10},
{id: 2, title: "Dogs", img_url: "2", author_id: 1, created_at: "2018-04-16 05:06:34",
  updated_at: "2018-04-18 06:19:14", rating: 1, price: 10},
{id: 3, title: "Cats", img_url: "3", author_id: 1, created_at: "2018-04-16 05:06:47",
  updated_at: "2018-04-18 06:19:14", rating: 4, price: 10},
{id: 4, title: "Projectors", img_url: "4", author_id: 2, created_at: "2018-04-16 05:08:39",
  updated_at: "2018-04-18 06:19:14", rating: 3, price: 10},
{id: 5, title: "Mosh pits", img_url: "5", author_id: 2, created_at: "2018-04-16 05:09:12",
  updated_at: "2018-04-18 06:19:14", rating: 5, price: 10},
{id: 6, title: "Table tennis", img_url: "6", author_id: 2, created_at: "2018-04-16 05:09:24",
  updated_at: "2018-04-18 06:19:14", rating: 2, price: 10},
{id: 7, title: "Water bottles", img_url: "7", author_id: 3, created_at: "2018-04-16 05:09:41",
  updated_at: "2018-04-18 06:19:14", rating: 4, price: 10},
{id: 8, title: "Dirty deeds", img_url: "8", author_id: 3, created_at: "2018-04-16 05:09:58",
  updated_at: "2018-04-18 06:19:14", rating: 3, price: 10},
{id: 9, title: "Meat", img_url: "9", author_id: 3, created_at: "2018-04-16 05:10:13",
  updated_at: "2018-04-18 06:19:14", rating: 2, price: 10}])

Store.create([{id: 1, title: "Store 1", address: "100 Adelaid st",
  city: "Brisbane", state: "qld", postcode: "4000", country: nil,
  created_at: "2018-04-17 03:03:16", updated_at: "2018-04-17 03:38:03",
  latitude: -27.468629, longitude: 153.0245063},
  {id: 2, title: "Store 2", address: "200 George st", city: "Brisbane",
    state: "qld", postcode: "4000", country: nil,
    created_at: "2018-04-17 03:03:41", updated_at: "2018-04-17 03:38:04",
    latitude: -27.4717015, longitude: 153.0242526},
  {id: 3, title: "Store 3", address: "300 Ann st", city: "Brisbane",
    state: "qld", postcode: "4000", country: nil,
    created_at: "2018-04-17 03:04:02", updated_at: "2018-04-17 03:38:05",
    latitude: -27.4650528, longitude: 153.0273134},
  {id: 4, title: "Store 4", address: "400 Turbot st", city: "Brisbane",
    state: "qld", postcode: "4000", country: nil,
    created_at: "2018-04-17 03:04:28", updated_at: "2018-04-17 03:38:05",
    latitude: -27.4624798, longitude: 153.0293772}])

Author.create([{id: 1, first_name: "Doug", last_name: "Harrison",
  img_url: "doug.jpeg", created_at: "2018-04-16 05:04:31",
  updated_at: "2018-04-16 06:14:26"},
  {id: 2, first_name: "Moshie", last_name: "Hern", img_url: "moshie.jpeg",
    created_at: "2018-04-16 05:07:16", updated_at: "2018-04-16 06:15:17"},
  {id: 3, first_name: "Butch", last_name: "Aspen", img_url: "butch.jpeg",
    created_at: "2018-04-16 05:07:37", updated_at: "2018-04-16 06:16:02"}]) 
