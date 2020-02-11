# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
unless Admin.find_by(email: "codecircle13@gmail.com").present?
  Admin.create(email: "codecircle13@gmail.com", password: "mered1913")
  puts "Inserted Admin"
  end

require 'csv'

if File.file?(Rails.root.join('lib/event_seeds.csv'))
  counter = 0
  CSV.foreach(Rails.root.join('lib/event_seeds.csv'), headers: true) do |row|
    Event.create!({
      title: row[0].strip,
      description: row[1],
      min_deg: row[2],
      amount: row[3],
      on_what: row[4]
    })
    counter += 1
  end
  puts "Inserted #{counter} Events"
end

if File.file?(Rails.root.join('lib/option_seeds.csv'))
  counter = 0
  CSV.foreach(Rails.root.join('lib/option_seeds.csv'), headers: true) do |row|
    Option.create!({
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
    counter += 1
    # puts "Option: #{row[0]}, row: #{counter}"
  end
  puts "Inserted #{counter} Options"
end

if File.file?(Rails.root.join('lib/minister_seeds.csv'))
  counter = 0
  CSV.foreach(Rails.root.join('lib/minister_seeds.csv'), headers: true) do |row|
    Minister.create!({
      role: row[0],
      description: row[1]
    })
    counter += 1
  end
  puts "Inserted #{counter} Ministers"
end

if File.file?(Rails.root.join('lib/goal_seeds.csv'))
  counter = 0
  CSV.foreach(Rails.root.join('lib/goal_seeds.csv'), headers: true) do |row|
    Goal.create!({
      description: row[0]
    })
    counter += 1
  end
  puts "Inserted #{counter} Goals"
end

if File.file?(Rails.root.join('lib/facts_seeds.csv'))
  counter = 0
  CSV.foreach(Rails.root.join('lib/facts_seeds.csv'), headers: true) do |row|
    Fact.create!({
      content: row[1]
    })
    counter += 1
  end
  puts "Inserted #{counter} Facts"
end
