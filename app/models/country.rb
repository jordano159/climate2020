class Country < ApplicationRecord
  has_and_belongs_to_many :options, join_table: "countries_options"
  has_and_belongs_to_many :events, join_table: "countries_events"
  after_initialize :set_defaults

  enum resilience:          %i[civil_war terrible neutral excellent], _prefix: true
  enum reg_rel:             %i[war terrible neutral excellent], _prefix: true
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
  validates :year,          numericality: { only_integer: true, greater_than_or_equal_to: 2020 }
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
    flag = false
    if   option.read_attribute_before_type_cast(:min_resilience)      <= read_attribute_before_type_cast(:resilience)   &&
            option.read_attribute_before_type_cast(:min_reg_rel)      <= read_attribute_before_type_cast(:reg_rel)      &&
            option.min_budget                                         <= budget                                         &&
            option.min_civ_num                                        <= civ_num                                        &&
            option.read_attribute_before_type_cast(:min_agriculture)  <= read_attribute_before_type_cast(:agriculture)  &&
            option.read_attribute_before_type_cast(:min_education)    <= read_attribute_before_type_cast(:education)    &&
            option.read_attribute_before_type_cast(:min_security)     <= read_attribute_before_type_cast(:security)     &&
            option.read_attribute_before_type_cast(:min_comms)        <= read_attribute_before_type_cast(:comms)        &&
            option.read_attribute_before_type_cast(:min_social_sec)   <= read_attribute_before_type_cast(:social_sec)   &&
            option.read_attribute_before_type_cast(:min_health)       <= read_attribute_before_type_cast(:health)       &&
            option.read_attribute_before_type_cast(:min_water)        <= read_attribute_before_type_cast(:water)        &&
            option.read_attribute_before_type_cast(:min_energy)       <= read_attribute_before_type_cast(:energy)

			flag = true
			# ceilig checks:
      # case option.on_what
      # when "resilience", "reg_rel"
      #   flag = true if self.read_attribute_before_type_cast(option.on_what.to_sym) + option.amount < 6
      # when "agriculture", "education", "security", "comms", "social_sec", "health", "water", "energy"
      #   flag = true if self.read_attribute_before_type_cast(option.on_what.to_sym) + option.amount < 3
      # else
      #   flag = true
      # end
      # puts "ceiling check: #{self.read_attribute_before_type_cast(option.on_what.to_sym)} + #{option.amount}"
      # if option.on_what2.present?
      #   case option.on_what2
      #   when "resilience", "reg_rel"
      #     flag = true if self.read_attribute_before_type_cast(option.on_what2.to_sym) + option.amount < 6
      #   when "agriculture", "education", "security", "comms", "social_sec", "health", "water", "energy"
      #     flag = true if self.read_attribute_before_type_cast(option.on_what2.to_sym) + option.amount < 3
      #   else
      #     flag = true
      #   end
      #   puts "ceiling check: #{self.read_attribute_before_type_cast(option.on_what2.to_sym)} + #{option.amount}"
      # end
    else
      flag = false
    end
    return flag
  end

  def degrees
    year = 2025
    20.times do
      puts (0.003 * (2 ** ((year - 2020) / 5)))
      year += 5
    end
  end

  def set_score
    puts "***********************************************"
    enum_attributes = %w(resilience reg_rel agriculture education security comms social_sec health water energy)
    score = (self.year - 2020)/2
    score = 40 if score > 40
    puts score
    score = score + ((self.civ_num / self.init_civ) * 40)
    puts score
    puts "year: " + (self.year - 2020).to_s
    puts "year score: " + ((self.year - 2020)/5).to_s
    puts "init_civ: " + self.init_civ.to_s
    puts "current_civ: " + self.civ_num.to_s
    puts "civ: " + (self.civ_num / self.init_civ).to_s
    puts "score = " + ((self.year - 2020)/5).to_s + " + " + ((self.civ_num / self.init_civ) * 40).to_s
    puts score
    enum_attributes.each do |attribute|
      score = score + ((read_attribute_before_type_cast(attribute.to_sym) + 1).to_f)*5/9
      puts attribute + " " + (((read_attribute_before_type_cast(attribute.to_sym) + 1).to_f)*5/9).to_s
      puts score.to_i
    end
    self.score = score.to_i
    self.save
  end

  def compare
    puts "***************compare*************************"
    score = self.score
    scores = Country.where.not(id: self.id).where("score != ?", 0).pluck(:score)
    counter = 0
    scores.each do |s|
      if score > s
        counter += 1
      end
    end
    percent = (counter * 100) / scores.size
    puts "*****************end compare***********************"
    return percent
  end


  private

  def set_defaults
    if self.new_record?
      self.resilience ||= :neutral
      self.reg_rel ||= :neutral
      self.init_civ ||= rand(40.0..70.0).round(2)
      self.civ_num ||= self.init_civ
      self.deg ||= 1.0
      self.life_level ||= 10
      self.budget ||= (self.civ_num * 3).to_i
      self.score ||= 0
      self.year ||= 2020
      self.is_conquered ||= false
    end
  end

end
