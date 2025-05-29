export const weatherTranslations: Record<string, string> = {
  // Clear sky
  "clear sky": "trời quang",
  // Clouds
  "few clouds": "ít mây",
  "scattered clouds": "mây rải rác",
  "broken clouds": "mây đứt đoạn",
  "overcast clouds": "mây u ám",
  // Rain
  "light rain": "mưa nhẹ",
  "moderate rain": "mưa vừa",
  "heavy intensity rain": "mưa to",
  "very heavy rain": "mưa rất to",
  "extreme rain": "mưa cực to",
  "freezing rain": "mưa đá",
  "light intensity shower rain": "mưa rào nhẹ",
  "shower rain": "mưa rào",
  "heavy intensity shower rain": "mưa rào to",
  "ragged shower rain": "mưa rào rải rác",
  // Drizzle
  "light intensity drizzle": "mưa phùn nhẹ",
  "drizzle": "mưa phùn",
  "heavy intensity drizzle": "mưa phùn to",
  "light intensity drizzle rain": "mưa phùn nhẹ",
  "drizzle rain": "mưa phùn",
  "heavy intensity drizzle rain": "mưa phùn to",
  "shower rain and drizzle": "mưa rào và mưa phùn",
  "heavy shower rain and drizzle": "mưa rào to và mưa phùn",
  "shower drizzle": "mưa phùn rải rác",
  // Thunderstorm
  "thunderstorm with light rain": "dông với mưa nhẹ",
  "thunderstorm with rain": "dông với mưa",
  "thunderstorm with heavy rain": "dông với mưa to",
  "light thunderstorm": "dông nhẹ",
  "thunderstorm": "dông",
  "heavy thunderstorm": "dông to",
  "ragged thunderstorm": "dông rải rác",
  "thunderstorm with light drizzle": "dông với mưa phùn nhẹ",
  "thunderstorm with drizzle": "dông với mưa phùn",
  "thunderstorm with heavy drizzle": "dông với mưa phùn to",
  // Snow
  "light snow": "tuyết nhẹ",
  "snow": "tuyết",
  "heavy snow": "tuyết dày",
  "sleet": "mưa tuyết",
  "light shower sleet": "mưa tuyết nhẹ",
  "shower sleet": "mưa tuyết",
  "light rain and snow": "mưa và tuyết nhẹ",
  "rain and snow": "mưa và tuyết",
  "light shower snow": "tuyết rơi nhẹ",
  "shower snow": "tuyết rơi",
  "heavy shower snow": "tuyết rơi dày",
  // Atmosphere
  "mist": "sương mù",
  "smoke": "khói",
  "haze": "sương mù nhẹ",
  "dust": "bụi",
  "fog": "sương mù dày",
  "sand": "cát",
  "ash": "tro",
  "squall": "gió giật",
  "tornado": "lốc xoáy",
};

export function translateWeather(description: string): string {
  return weatherTranslations[description.toLowerCase()] || description;
} 