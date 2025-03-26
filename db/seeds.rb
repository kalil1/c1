# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'

# Delete all existing meetings
Meeting.delete_all

# Define the current month's start and end date
start_of_month = Time.current.beginning_of_month
end_of_month = Time.current.end_of_month

# Generate non-overlapping meetings
meetings = []
while meetings.size < 100
  start_time = Faker::Time.between(from: start_of_month, to: end_of_month).to_time
  end_time = start_time + rand(30..120) * 60 # Convert minutes to seconds

  # Ensure no overlap using manual check
  overlap = meetings.any? { |m| start_time < m[:end_time] && end_time > m[:start_time] }
  
  unless overlap
    meetings << { name: Faker::Company.catch_phrase, start_time: start_time, end_time: end_time }
  end
end

# Insert meetings into the database
Meeting.insert_all(meetings)

puts "Seeded #{Meeting.count} non-overlapping meetings!"
