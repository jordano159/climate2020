class Option < ApplicationRecord
  belongs_to :event
  enum operator:                %i[plus minus], _prefix: true
  enum min_resilience:          Country.resiliences.keys, _prefix: true
  enum min_reg_rel:             Country.reg_rels.keys, _prefix: true
  enum min_agriculture:         Country.agricultures.keys, _prefix: true
  enum min_education:           Country.educations.keys, _prefix: true
  enum min_security:            Country.securities.keys, _prefix: true
  enum min_comms:               Country.comms.keys, _prefix: true
  enum min_social_sec:          Country.social_secs.keys, _prefix: true
  enum min_health:              Country.healths.keys, _prefix: true
  enum min_water:               Country.waters.keys, _prefix: true
  enum min_energy:              Country.energies.keys, _prefix: true

  after_initialize :set_defaults

  validates :title,             presence: true
  validates :operator,          inclusion: { in: Option.operators.keys }
  validates :amount,            numericality: { greater_than: 0 }
  validates :on_what,           inclusion: { in: %w(budget resilience civ_num deg life_level score year reg_rel is_conquered agriculture education security comms social_sec health water energy) }
  validates :min_civ_num,       numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :min_budget,        numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :min_resilience,    inclusion: { in: Option.min_resiliences.keys }, allow_nil: true
  validates :min_reg_rel,       inclusion: { in: Option.min_reg_rels.keys }, allow_nil: true
  validates :min_agriculture,   inclusion: { in: Option.min_agricultures.keys }, allow_nil: true
  validates :min_education,     inclusion: { in: Option.min_educations.keys }, allow_nil: true
  validates :min_security,      inclusion: { in: Option.min_securities.keys }, allow_nil: true
  validates :min_comms,         inclusion: { in: Option.min_comms.keys }, allow_nil: true
  validates :min_social_sec,    inclusion: { in: Option.min_social_secs.keys }, allow_nil: true
  validates :min_health,        inclusion: { in: Option.min_healths.keys }, allow_nil: true
  validates :min_water,         inclusion: { in: Option.min_waters.keys }, allow_nil: true
  validates :min_energy,        inclusion: { in: Option.min_energies.keys }, allow_nil: true

  private

  def set_defaults
    if self.new_record?
      self.min_budget   ||= 0
      self.min_civ_num   ||= 0
      self.min_resilience   ||= :revolution
      self.min_reg_rel      ||= :war
      self.min_agriculture  ||= :low
      self.min_education    ||= :low
      self.min_security     ||= :low
      self.min_comms        ||= :low
      self.min_social_sec   ||= :low
      self.min_health       ||= :low
      self.min_water        ||= :low
      self.min_energy       ||= :low
    end
  end
end
