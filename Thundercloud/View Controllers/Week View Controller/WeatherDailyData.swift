import Foundation

public struct WeatherDailyData {
    
    public var time: Date?
    public var summary: String?
    public var icon: String?
    public var sunriseTime: Date?
    public var sunsetTime: Date?
    public var moonPhase: Double?
    public var precipIntensity: Double?
    public var precipIntensityMax: Double?
    public var precipIntensityMaxTime: Date?
    public var precipProbability: Double?
    public var precipType: String?
    
    public var temperatureHigh: Double?
    public var temperatureHighTime: Date?
    public var temperatureLow: Double?
    public var temperatureLowTime: Date?
    public var apparentTemperatureHigh: Double?
    public var apparentTemperatureHighTime: Date?
    public var apparentTemperatureLow: Double?
    public var apparentTemperatureLowTime: Date?
    public var windGust: Double?
    public var windGustTime: Date?
    public var uvIndex: Double?
    public var uvIndexTime: Date?
    
    public var temperatureMin: Double?
    public var temperatureMinTime: Date?
    public var temperatureMax: Double?
    public var temperatureMaxTime: Date?
    public var apparentTemperatureMin: Double?
    public var apparentTemperatureMinTime: Date?
    public var apparentTemperatureMax: Double?
    public var apparentTemperatureMaxTime: Date?
    public var dewPoint: Double?
    public var windSpeed: Double?
    public var windBearing: Double?
    public var cloudCover: Double?
    public var humidity: Double?
    public var pressure: Double?
    public var visibility: Double?
    public var ozone: Double?
    
    public init(time: Date? = nil, summary: String?, icon: String?, sunriseTime: Date?, sunsetTime: Date?, moonPhase: Double?, precipIntensity: Double?, precipIntensityMax: Double?, precipIntensityMaxTime: Date?, precipProbability: Double?, precipType: String?, temperatureHigh: Double?, temperatureHighTime: Date?, temperatureLow: Double?, temperatureLowTime: Date?, temperatureMin: Double?, temperatureMinTime: Date?, temperatureMax: Double?, temperatureMaxTime: Date?, apparentTemperatureMin: Double?, apparentTemperatureMinTime: Date?, apparentTemperatureMax: Double?, apparentTemperatureMaxTime: Date?, dewPoint: Double?, windSpeed: Double?, windBearing: Double?, cloudCover: Double?, humidity: Double?, pressure: Double?, visibility: Double?, ozone: Double?, apparentTemperatureHigh: Double?, apparentTemperatureHighTime: Date?, apparentTemperatureLow: Double?, apparentTemperatureLowTime: Date?, windGust: Double?, windGustTime: Date?, uvIndex: Double?, uvIndexTime: Date?) {

        self.time = time ?? nil
        self.summary = summary ?? nil
        self.icon = icon ?? nil
        self.sunriseTime = sunriseTime ?? nil
        self.sunsetTime = sunsetTime ?? nil
        self.moonPhase = moonPhase ?? nil
        self.precipIntensity = precipIntensity ?? nil
        self.precipIntensityMax = precipIntensityMax ?? nil
        self.precipIntensityMaxTime = precipIntensityMaxTime ?? nil
        self.precipProbability = precipProbability ?? nil
        self.precipType = precipType ?? nil
        
        self.temperatureHigh = temperatureHigh ?? nil
        self.temperatureHighTime = temperatureHighTime  ?? nil
        self.temperatureLow = temperatureLow  ?? nil
        self.temperatureLowTime = temperatureLowTime ?? nil
        self.apparentTemperatureHigh = apparentTemperatureHigh  ?? nil
        self.apparentTemperatureHighTime = apparentTemperatureHighTime  ?? nil
        self.apparentTemperatureLow = apparentTemperatureLow  ?? nil
        self.apparentTemperatureLowTime = apparentTemperatureLowTime  ?? nil
        self.windGust = windGust  ?? nil
        self.windGustTime = windGustTime  ?? nil
        self.uvIndex = uvIndex  ?? nil
        self.uvIndexTime = uvIndexTime ?? nil
        
        self.temperatureMin = temperatureMin ?? nil
        self.temperatureMinTime = temperatureMinTime ?? nil
        self.temperatureMax = temperatureMax ?? nil
        self.temperatureMaxTime = temperatureMaxTime ?? nil
        self.apparentTemperatureMin = apparentTemperatureMin ?? nil
        self.apparentTemperatureMinTime = apparentTemperatureMinTime ?? nil
        self.apparentTemperatureMax = apparentTemperatureMax ?? nil
        self.apparentTemperatureMaxTime = apparentTemperatureMaxTime ?? nil
        self.dewPoint = dewPoint ?? nil
        self.windSpeed = windSpeed ?? nil
        self.windBearing = windBearing ?? nil
        self.cloudCover = cloudCover ?? nil
        self.humidity = humidity ?? nil
        self.pressure = pressure ?? nil
        self.visibility = visibility ?? nil
        self.ozone = ozone ?? nil
        }
}

extension WeatherDailyData: JSONDecodable {
    
    public init(decoder: JSONDecoder) throws {
        if let time: Double = try? decoder.decode(key: "time") {
            self.time = Date(timeIntervalSince1970: time)
        }
        
        self.summary = (try? decoder.decode(key: "summary")) ?? ""
        self.icon = (try? decoder.decode(key: "icon")) ?? ""
        
        if let sunriseTime: Double = try? decoder.decode(key: "sunriseTime") {
            self.sunriseTime = Date(timeIntervalSince1970: sunriseTime)
        }
        
        if let sunsetTime: Double = try? decoder.decode(key: "sunsetTime") {
            self.sunsetTime = Date(timeIntervalSince1970: sunsetTime)
        }
        
        self.moonPhase = try? decoder.decode(key: "moonPhase")
        self.precipIntensity = try? decoder.decode(key: "precipIntensity")
        self.precipIntensityMax = try? decoder.decode(key: "precipInensityMax")
        if let precipIntensityMaxTime: Double = try? decoder.decode(key: "precipIntensityMaxTime") {
            self.precipIntensityMaxTime = Date(timeIntervalSince1970: precipIntensityMaxTime)
        }

        self.precipProbability = try? decoder.decode(key: "precipProbability")
        self.precipType = try? decoder.decode(key: "precipType")
        self.temperatureHigh = try? decoder.decode(key: "temperatureHigh")
        if let temperatureHighTime: Double = try? decoder.decode(key: "temperatureHighTime") {
            self.temperatureHighTime = Date(timeIntervalSince1970: temperatureHighTime)
        }
        self.temperatureLow = try? decoder.decode(key: "temperatureLow")
        if let temperatureLowTime: Double = try? decoder.decode(key: "temperatureLowTime") {
            self.temperatureLowTime = Date(timeIntervalSince1970: temperatureLowTime)
        }
        self.apparentTemperatureHigh = try? decoder.decode(key: "apparentTemperatureHigh")
        if let apparentTemperatureHighTime: Double = try? decoder.decode(key: "apparentTemperatureHighTime") {
            self.apparentTemperatureHighTime = Date(timeIntervalSince1970: apparentTemperatureHighTime)
        }
        self.apparentTemperatureLow = try? decoder.decode(key: "apparentTemperatureLow")
        if let apparentTemperatureLowTime: Double = try? decoder.decode(key: "apparentTemperatureLowTime") {
            self.apparentTemperatureLowTime = Date(timeIntervalSince1970: apparentTemperatureLowTime)
        }
        self.windGust = try? decoder.decode(key: "windGust")
        if let windGustTime: Double = try? decoder.decode(key: "windGustTime") {
            self.windGustTime = Date(timeIntervalSince1970: windGustTime)
        }
        self.uvIndex = try? decoder.decode(key: "uvIndex")
        if let uvIndexTime: Double = try? decoder.decode(key: "uvIndexTime") {
            self.uvIndexTime = Date(timeIntervalSince1970: uvIndexTime)
        }
        
        self.temperatureMin = try? decoder.decode(key: "temperatureMin")
        if let temperatureMinTime: Double = try? decoder.decode(key: "temperatureMinTime") {
            self.temperatureMinTime = Date(timeIntervalSince1970: temperatureMinTime)
        }
        self.temperatureMax = try? decoder.decode(key: "temperatureMax")
        if let temperatureMaxTime: Double = try? decoder.decode(key: "temperatureMaxTime") {
            self.temperatureMaxTime = Date(timeIntervalSince1970: temperatureMaxTime)
        }
        self.apparentTemperatureMin = try? decoder.decode(key: "apparentTemperatureMin")
        if let apparentTemperatureMinTime: Double = try? decoder.decode(key: "apparentTemperatureMinTime") {
            self.apparentTemperatureMinTime = Date(timeIntervalSince1970: apparentTemperatureMinTime)
        }
        self.apparentTemperatureMax = try? decoder.decode(key: "apparentTemperatureMax")
        if let apparentTemperatureMaxTime: Double = try? decoder.decode(key: "apparentTemperatureMaxTime") {
            self.apparentTemperatureMaxTime = Date(timeIntervalSince1970: apparentTemperatureMaxTime)
        }
        self.dewPoint = try? decoder.decode(key: "dewPoint")
        self.windSpeed = try? decoder.decode(key: "windSpeed")
        self.windBearing = try? decoder.decode(key: "windBearing")
        self.cloudCover = try? decoder.decode(key: "cloudCover")
        self.humidity = try? decoder.decode(key: "humidity")
        self.pressure = try? decoder.decode(key: "pressure")
        self.visibility = try? decoder.decode(key: "visibility")
        self.ozone = try? decoder.decode(key: "ozone")
        
    }
    
}

