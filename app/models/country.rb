class Country < ApplicationRecord
  enum resilience:  %i[excellent good neutral bad terrible revolution], _prefix: true
  enum reg_rel:     %i[excellent good neutral bad terrible revolution], _prefix: true
  enum agriculture: %i[high medium low], _prefix: true
  enum education:   %i[high medium low], _prefix: true
  enum security:    %i[high medium low], _prefix: true
  enum comms:       %i[high medium low], _prefix: true
  enum social_sec:  %i[high medium low], _prefix: true
  enum health:      %i[high medium low], _prefix: true
  enum water:       %i[high medium low], _prefix: true
  enum energy:      %i[high medium low], _prefix: true

  validates :name,          presence: true
  validates :init_civ,      numericality: { greater_than: 0 }
  validates :civ_num,       numericality: { greater_than_or_equal_to: 0 }
  validates :deg,           numericality: { greater_than_or_equal_to: 1.0 }
  validates :life_level,    numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :score,         numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :year,          numericality: { only_integer: true, greater_than_or_equal_to: 2020, less_than_or_equal_to: 2100 }
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

end
