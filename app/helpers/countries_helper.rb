module CountriesHelper
  def agrihash
    agri = {
      low: "נמוך - חרישה ידנית",
      medium: "בינוני - טפטפות",
      high: "גבוה - מערכות השקייה אוטומטיות"
    }
  end

  def eduhash
    edu = {
      low: "נמוך - חצי מהתלמידים בבית ספר",
      medium: "בינוני - ספרי לימוד יד שנייה לכולם",
      high: "גבוה - כולם בביה''ס לאתגרי העתיד"
    }
  end

  def securityhash
    security = {
      low: "נמוך - עשרים חיילים על אופניים",
      medium: "בינוני - חיל רגלים וטנקים",
      high: "גבוה - חיילים מהונדסים גנטית שגודלו במעבדה"
    }
  end

  def commshash
    comms = {
      low: "נמוך - רדיו",
      medium: "בינוני - אינטרנט מדי פעם לרוב המקומות",
      high: "גבוה - אינטרנט מהיר ועוצמתי בכל מקום"
    }
  end

  def social_sechash
    social_sec = {
      low: "נמוך - אין ביטוח לאומי",
      medium: "בינוני - קופה סבירה שיכולה לשלם פיצויים",
      high: "גבוה - קופה גדולה ותכניות לאומיות להגברת השיוויון"
    }
  end

  def healthhash
    health = {
      low: "נמוך - יש רק מרפאות בודדות במקומות מרכזיים",
      medium: "בינוני - בתי חולים במרכז הארץ",
      high: "גבוה - גישה נוחה לטיפול רפואי רחב"
    }
  end

  def waterhash
    water = {
      low: "נמוך - בארות וכדי מים",
      medium: "בינוני - מערכת שאיבת מי תהום",
      high: "גבוה - התפלת מי ים"
    }
  end

  def energyhash
    energy = {
      low: "נמוך - גנרטורים מקומיים",
      medium: "בינוני - רשת חשמל ארצית חצי מתפקדת",
      high: "גבוה - חשמל זמין תמיד בכל חלקי הארץ"
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
