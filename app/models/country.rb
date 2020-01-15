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

end
