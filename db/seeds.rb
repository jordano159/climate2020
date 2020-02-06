# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Admin.create(email: "codecircle13@gmail.com", password: "mered1913")

require 'csv'

if File.file?(Rails.root.join('lib/event_seeds.csv'))
  CSV.foreach(Rails.root.join('lib/event_seeds.csv'), headers: true) do |row|
    Event.create({
      title: row[0],
      description: row[1],
      min_deg: row[2]
    })
  end
  puts "Inserted Events"
end

if File.file?(Rails.root.join('lib/option_seeds.csv'))
  CSV.foreach(Rails.root.join('lib/option_seeds.csv'), headers: true) do |row|
    Option.create({
      title: row[0],
      amount: row[1],
      on_what: row[2],
      amount2: row[3],
      on_what2: row[4],
      event_id: Event.find_by(title: row[5]).id,
      min_resilience: row[6],
      min_budget: row[7],
      min_civ_num: row[8],
      min_reg_rel: row[9],
      min_agriculture: row[10],
      min_education: row[11],
      min_security: row[12],
      min_comms: row[13],
      min_social_sec: row[14],
      min_health: row[15],
      min_water: row[16],
      min_energy: row[17]
    })
  end
  puts "Inserted Options"
end

# if File.file?(Rails.root.join('lib/minister_seeds.csv'))
#   CSV.foreach(Rails.root.join('lib/minister_seeds.csv'), headers: true) do |row|
#     Minister.create({
#       role: row[0],
#       description: row[1]
#     })
#   end
#   puts "Inserted Ministers"
# end
#
# if File.file?(Rails.root.join('lib/goal_seeds.csv'))
#   CSV.foreach(Rails.root.join('lib/goal_seeds.csv'), headers: true) do |row|
#     Goal.create({
#       description: row[0]
#     })
#   end
#   puts "Inserted Goals"
# end
#
# if File.file?(Rails.root.join('lib/facts_seeds.csv'))
#   CSV.foreach(Rails.root.join('lib/facts_seeds.csv'), headers: true) do |row|
#     Fact.create({
#       content: row[1]
#     })
#   end
# end
