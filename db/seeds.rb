# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Slab.create([
  {
    name: "Generic",
    slab_1_from: "0",
    slab_1_to: "399",
    slab_1_amount: 10,
    slab_2_from: "400",
    slab_2_to: "699",
    slab_2_amount: 20,
    slab_3_from: "700",
    slab_3_to: "999",
    slab_3_amount: 25,
    slab_4_from: "1000",
    slab_4_to: "99999999999",
    slab_4_amount: 30,
  },
  {
    name: "Bonus",
    slab_1_from: "0",
    slab_1_to: "199",
    slab_1_amount: 2,
    slab_2_from: "200",
    slab_2_to: "699",
    slab_2_amount: 10,
    slab_3_from: "700",
    slab_3_to: "99999999999",
    slab_3_amount: 20,
  },
  {
    name: "None",
  }
])

clap_agency = Agency.create(name: "Clap", contact_number: "4545454")
raghu_agency = Agency.create(name: "Raghu", contact_number: "4545454")
pramod_agency = Agency.create(name: "Pramod", contact_number: "4545454")

Driver.create([
  {
    name: "Maru",
    age: "33",
    contact_number: "9845794833",
    agency: clap_agency,
    plan: "Daily",
    daily_charge: "60",
    slab: Slab.find_by_name("None"),
  },
  {
    name: "Jasim",
    age: "33",
    contact_number: "9845794833",
    agency: raghu_agency,
    plan: "Monthly",
    monthy_charge: "1000",
    slab: Slab.find_by_name("None"),
  },
  {
    name: "Varun",
    age: "33",
    contact_number: "9845794833",
    agency: clap_agency,
    plan: "Fixed per rider",
    daily_charge: "100",
    slab: Slab.find_by_name("None"),
  },
  {
    name: "Sajin",
    age: "33",
    contact_number: "9845794833",
    agency: pramod_agency,
    plan: "Slab",
    slab: Slab.find_by_name("Generic"),
  },
])

vehicle = Vehicle.create(name: "Swift Desire", kind: "Four Wheeler", category: "Sedan", gear: "Manual", fuel: "Petrol")
nissan = Vehicle.create(name: "Nissan Sunny", kind: "Four Wheeler", category: "Sedan", gear: "Automatic", fuel: "Petrol")
audi = Vehicle.create(name: "Audi - Q5", kind: "Four Wheeler", category: "Sedan", gear: "Automatic", fuel: "Petrol")

Customer.create([
  {
    name: "Amal Fra",
    contact_number: "98732984732",
    vehicle: vehicle
  },
  {
    name: "Diya",
    sex: "Female",
    contact_number: "719740173",
    vehicle: nissan
  },
  {
    name: "Amjad",
    sex: "Male",
    contact_number: "91720211238",
    vehicle: audi,
    requirement: "Black Shirt"
  }
])
