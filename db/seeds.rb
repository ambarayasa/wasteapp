# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create(role: "User")
Role.create(role: "Admin")

# Dummy user
User.create(
    username: "JohnDoe",
    password_digest: "test123",
    email: "johndoe@gmail.com",
    name: "John Doe",
    address: "Jl. Dreamwwalking",
    gender: "Unknown",
    balance: "0",
    role_id: 1
)