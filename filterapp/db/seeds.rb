# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([
  { name: 'Xbox S',
    description: 'Features: Ultra HD 4K Blu-ray And Streaming, High Dynamic Range, Up To 2TB Storage',
    price: 549
  },
  { name: 'Playstation 4 Pro',
    description: 'With updated graphics architecture and support for 4K gaming the PS4 Pro provides increased detail higher-resolution graphics and faster',
    price: 559
  },
  { name: 'Wii U',
    description: 'With unique games for all the family and the innovative Wii U GamePad controller, you can\'t play like this anywhere else.',
    price: 419
  }
  ])
