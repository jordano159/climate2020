class Country < ApplicationRecord
  enum resilience:          %i[revolution terrible bad neutral good excellent], _prefix: true
  enum reg_rel:             %i[war terrible bad neutral good excellent], _prefix: true
  enum agriculture:         %i[low medium high], _prefix: true
  enum education:           %i[low medium high], _prefix: true
  enum security:            %i[low medium high], _prefix: true
  enum comms:               %i[low medium high], _prefix: true
  enum social_sec:          %i[low medium high], _prefix: true
  enum health:              %i[low medium high], _prefix: true
  enum water:               %i[low medium high], _prefix: true
  enum energy:              %i[low medium high], _prefix: true

  validates :name,          presence: true
  validates :init_civ,      numericality: { greater_than: 0 }
  validates :civ_num,       numericality: { greater_than_or_equal_to: 0 }
  validates :deg,           numericality: { greater_than_or_equal_to: 1.0 }
  validates :life_level,    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :score,         numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :year,          numericality: { only_integer: true, greater_than_or_equal_to: 2020, less_than_or_equal_to: 2100 }
  validates :budget,        numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_conquered,  inclusion: { in: [true, false] }
  validates :resilience,    inclusion: { in: Country.resiliences.keys }
  validates :reg_rel,       inclusion: { in: Country.reg_rels.keys }
  validates :agriculture,   inclusion: { in: Country.agricultures.keys }
  validates :education,     inclusion: { in: Country.educations.keys }
  validates :security,      inclusion: { in: Country.securities.keys }
  validates :comms,         inclusion: { in: Country.comms.keys }
  validates :social_sec,    inclusion: { in: Country.social_secs.keys }
  validates :health,        inclusion: { in: Country.healths.keys }
  validates :water,         inclusion: { in: Country.waters.keys }
  validates :energy,        inclusion: { in: Country.energies.keys }

  def is_option_available(option)
    if   option.read_attribute_before_type_cast(:min_resilience) <= read_attribute_before_type_cast(:resilience) &&
            option.read_attribute_before_type_cast(:min_reg_rel) <= read_attribute_before_type_cast(:reg_rel) &&
        option.read_attribute_before_type_cast(:min_agriculture) <= read_attribute_before_type_cast(:agriculture) &&
          option.read_attribute_before_type_cast(:min_education) <= read_attribute_before_type_cast(:education) &&
           option.read_attribute_before_type_cast(:min_security) <= read_attribute_before_type_cast(:security) &&
              option.read_attribute_before_type_cast(:min_comms) <= read_attribute_before_type_cast(:comms) &&
         option.read_attribute_before_type_cast(:min_social_sec) <= read_attribute_before_type_cast(:social_sec) &&
             option.read_attribute_before_type_cast(:min_health) <= read_attribute_before_type_cast(:health) &&
              option.read_attribute_before_type_cast(:min_water) <= read_attribute_before_type_cast(:water) &&
             option.read_attribute_before_type_cast(:min_energy) <= read_attribute_before_type_cast(:energy)
      return true
    else
      return false
    end
  end
  # f = :+
  # puts 1.public_send(f, 2) # => 3
  #
  # enum operator: ["plus", "minus"]
  #
  # def method(option)
  #   operator.plus? ? operator = :+ : operator = :-
  #   @country.send(option.column) = @country.send(option.column).public_send(operator, option.val)
  #   @country.save
  # end
  #
  # @country.method(@option)

end
