

puts 'Cleaning database...'
Event.delete_all
User.delete_all

puts 'Creating experiences...'



  # create_table "events", force: :cascade do |t|
  #   t.string "event_name"
  #   t.text "description"
  #   t.integer "rsvp_limit"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "city"
  #   t.datetime "start_time"
  #   t.datetime "end_time"
  # end


event_attributes = [
    {
    event_name: "Potluck at Ed's",
    description:  "A unique experience at la casa del Ed!",
    start_time: Faker::Time.between(2.days.ago, Date.today, :all),
    end_time: Faker::Time.between(2.days.ago, Date.today, :all),
    rsvp_limit: rand(15..35),
    city: "Berlin",
  },
  {
    event_name: "Sunday Morn Brunch",
    description:  "A beautiful brunch at Marge's in East Village",
    start_time: Faker::Time.between(2.days.ago, Date.today, :all),
    end_time: Faker::Time.between(2.days.ago, Date.today, :all),
    rsvp_limit: rand(15..35),
    city: "New York",
  },
  {
    event_name: "Potluck Charity Event",
    description:  "BYOF and Ideas",
    start_time: Faker::Time.between(2.days.ago, Date.today, :all),
    end_time: Faker::Time.between(2.days.ago, Date.today, :all),
    rsvp_limit: rand(15..35),
    city: "Shanghai",
  },
  {
    event_name: "Happy Friendsgiving",
    description:  "Thanksgiving for those who are living a home away from home",
    start_time: Faker::Time.between(2.days.ago, Date.today, :all),
    end_time: Faker::Time.between(2.days.ago, Date.today, :all),
    rsvp_limit: rand(15..35),
    city: "New York",

  },
  {
    event_name: "Amazing, delicious Potluck Breakfast",
    description:  "Gonna be a good one!",
    start_time: Faker::Time.between(2.days.ago, Date.today, :all),
    end_time: Faker::Time.between(2.days.ago, Date.today, :all),
    rsvp_limit: rand(15..35),
    city: "Shanghai",
  },
  {
    event_name: "International Themed Brunch",
    description:  "And international festivity for everyone!",
    start_time: Faker::Time.between(2.days.ago, Date.today, :all),
    end_time: Faker::Time.between(2.days.ago, Date.today, :all),
    rsvp_limit: rand(15..35),
    city: "Berlin",
  },

]
Event.create!(event_attributes)



# puts "Creating event photos"
# a = 1
# db_dir = File.dirname(__FILE__)

# Event.all.each do |event|
#   puts "Creating event photo"
#   path = db_dir + "/images/image-#{a}.jpg"
#   event.photos = File.open(path)
#   event.save
#   a += 1
# end



puts 'Creating participants'
15.times do
  User.create(
    password: "123456",
    email: Faker::Internet.free_email,
    )
end



# puts "Creating greeter photos"
# a = 1
# db_dir = File.dirname(__FILE__)

# User.all.each do |user|
#   puts "creating greeter photo"
#   path = db_dir + "/images/image-#{a}.jpg"
#   user.photo_urls = [path]
#   user.save
#   a += 1
# end


puts "Finished!"
