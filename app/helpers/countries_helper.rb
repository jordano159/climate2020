module CountriesHelper
  def agrihash
    agri = {
      low: "נמוך - חרישה ידנית",
      medium: "בינוני - טפטפות",
      high: "גבוה - טרקטורים אוטונומים"
    }
  end

  def eduhash
    edu = {
      low: "נמוך - חצי מהתלמידים בבית ספר",
      medium: "בינוני - ספרי לימוד יד שנייה",
      high: "גבוה - כולם בביה''ס לאתגרי העתיד"
    }
  end

  def securityhash
    security = {
      low: "נמוך - עשרים חיילים על אופניים",
      medium: "בינוני - חיל רגלים וטנקים",
      high: "גבוה - חיילים מהונדסים גנטית"
    }
  end

  def commshash
    comms = {
      low: "נמוך - רדיו",
      medium: "בינוני - אינטרנט מדי פעם",
      high: "גבוה - אינטרנט מהיר ועוצמתי"
    }
  end

  def social_sechash
    social_sec = {
      low: "נמוך - פיצויים למי שמת",
      medium: "בינוני - קופה סבירה לפיצויים",
      high: "גבוה - תכניות לשיוויון לאומי"
    }
  end

  def healthhash
    health = {
      low: "נמוך - מרפאות בודדות",
      medium: "בינוני - בתי חולים במרכז הארץ",
      high: "גבוה - גישה נוחה לטיפול רפואי"
    }
  end

  def waterhash
    water = {
      low: "נמוך - בארות וכדי מים",
      medium: "בינוני - שאיבת מי תהום",
      high: "גבוה - התפלת מי ים"
    }
  end

  def energyhash
    energy = {
      low: "נמוך - גנרטורים מקומיים",
      medium: "בינוני - רשת חשמל רעועה",
      high: "גבוה - חשמל זמין תמיד"
    }
  end

  def reghash
    reg_rel = {
      war: "מלחמה",
      terrible: "נורא",
      neutral: "נייטרלי",
      excellent: "מצויין"
    }
  end

  def reshash
    resilience = {
      civil_war: "מלחמת אזרחים",
      terrible: "נורא",
      neutral: "נייטרלי",
      excellent: "מצויין"
    }
  end

end
