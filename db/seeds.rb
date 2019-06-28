# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

flights = Flight.create([
    {origin: 'Raleigh, NC (RDU)', destination: 'Paris, France (CDG)', price: 55000},
    {origin: 'Chicago, IL (ORD)', destination: 'Atlanta, GA (ATL)', price: 17500},
    {origin: 'New York, NY (NYS)', destination: 'Munich, Germany (MUC)', price: 45000},
    {origin: 'Raleigh, NC (RDU)', destination: 'New Orleans, LA (MSY)', price: 28000},
    {origin: 'Los Angeles, CA (LAX)', destination: 'Beijing, China (PEK)', price: 97575}])