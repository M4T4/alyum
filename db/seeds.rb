# frozen_string_literal: true

# frozen__literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.find_or_create_by(email: 'matt@alyum.com',
#                        password: '121212',
#                        password_confirmation: '121212')

# User.find_or_create_by(email: 'msanchez12@uabc.edu.mx',
#                        password: 'password',
#                        password_confirmation: 'password')


Language.find_or_create_by!(name: 'Cochimi')
Language.find_or_create_by!(name: 'Cocopa')
Language.find_or_create_by!(name: 'Diegueño')
Language.find_or_create_by!(name: 'Havasupai')
Language.find_or_create_by!(name: 'Hualapai')
Language.find_or_create_by!(name: 'Kiliwa')
Language.find_or_create_by!(name: "Ko'alh")
Language.find_or_create_by!(name: 'Kumeyaay')
Language.find_or_create_by!(name: 'Kumiay')
Language.find_or_create_by!(name: 'Maricopa')
Language.find_or_create_by!(name: 'Mojave')
Language.find_or_create_by!(name: 'Pa ipai')
Language.find_or_create_by!(name: 'Tolkapaya')
Language.find_or_create_by!(name: 'Walapai')
Language.find_or_create_by!(name: 'Yavapai')
Language.find_or_create_by!(name: 'Yuma')
Language.find_or_create_by!(name: 'Yumanas')
