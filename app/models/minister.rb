class Minister < ApplicationRecord
  validates :role,          presence: true
  validates :description,    presence: true

  def self.rand_ministers(num)
    ministers = []
    all = Minister.all
    return false if num > all.count || num <= 0
    counter = 1
    minister = all.sample
    ministers << minister
    while counter < num
      minister = all.sample
      unless ministers.pluck(:role).include?(minister.role)
        ministers << minister
        counter = counter + 1
        puts counter
      end
    end
    ministers
  end

end
