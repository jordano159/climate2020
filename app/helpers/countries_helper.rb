module CountriesHelper
  def agrihash
    agri = {
      low: "נמוך - חרישה ידנית",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def eduhash
    edu = {
      low: "נמוך - חצי מהתלמידים בבית ספר",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def securityhash
    security = {
      low: "נמוך - משהו גרוע",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def commshash
    comms = {
      low: "נמוך - רדיו",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def social_sechash
    social_sec = {
      low: "נמוך - אין ביטוח לאומי",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def healthhash
    health = {
      low: "נמוך - לא יודעים מה זה אנטיביוטיקה",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def waterhash
    water = {
      low: "נמוך - בארות וכדי מים",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def energyhash
    energy = {
      low: "נמוך - פחם מזהם",
      medium: "בינוני",
      high: "גבוה"
    }
  end

  def reghash
    reg_rel = {
      war: "מלחמה",
      terrible: "נורא",
      bad: "גרוע",
      neutral: "נייטרלי",
      good: "טוב",
      excellent: "מצויין"
    }
  end

  def reshash
    resilience = {
      civil_war: "מלחמת אזרחים",
      terrible: "נורא",
      bad: "גרוע",
      neutral: "נייטרלי",
      good: "טוב",
      excellent: "מצויין"
    }
  end

end
