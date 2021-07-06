//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

struct ForecastModel: Codable {
    
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - CurrentClass
struct Current: Codable {
    let lastUpdatedEpoch, isDay, humidity, cloud, windDegree: Int?
    let lastUpdated, windDir: String?
    let tempF, tempC, windMph, windKph, pressureMB, pressureIn,precipMm, precipIn,
        feelslikeC, feelslikeF, gustKph,gustMph, visKM, visMiles, uv: Double?
    let condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String?
    let code: Int?
}

// MARK: - Location
struct Location: Codable {
    let name, region, country, localtime: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}


// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase, moonIllumination: String?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double?
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double?
    let totalprecipMm, totalprecipIn, avgvisKM, avgvisMiles: Double?
    let avghumidity, dailyWillItRain: Double?
    let dailyChanceOfRain: String?
    let dailyWillItSnow: Double?
    let dailyChanceOfSnow: String?
    let condition: Condition?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}
