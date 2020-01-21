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
end

if File.file?(Rails.root.join('lib/option_seeds.csv'))
  CSV.foreach(Rails.root.join('lib/option_seeds.csv'), headers: true) do |row|
    Option.create({
      title: row[0],
      operator: row[1],
      amount: row[2],
      on_what: row[3],
      event_id: row[4],
      min_resilience: row[5],
      min_budget: row[6],
      min_civ_num: row[7],
      min_reg_rel: row[8],
      min_agriculture: row[9],
      min_education: row[10],
      min_security: row[11],
      min_comms: row[12],
      min_social_sec: row[13],
      min_health: row[14],
      min_water: row[15],
      min_energy: row[16]
    })
  end
end

if File.file?(Rails.root.join('lib/minister_seeds.csv'))
  CSV.foreach(Rails.root.join('lib/minister_seeds.csv'), headers: true) do |row|
    Minister.create({
      role: row[0],
      description: row[1]
    })
  end
end

if File.file?(Rails.root.join('lib/goal_seeds.csv'))
  CSV.foreach(Rails.root.join('lib/goal_seeds.csv'), headers: true) do |row|
    Goal.create({
      description: row[1]
    })
  end
end
