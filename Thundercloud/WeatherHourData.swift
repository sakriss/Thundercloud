import Foundation

public struct WeatherHourData {
    public var time: Date?
    public var summary: String?
    public var icon: String?
    public var sunriseTime: Date?
    public var sunsetTime: Date?
    public var moonPhase: Double?
    public var nearestStormDistance: Double?
    public var nearestStormBearing: Double?
    public var precipIntensity: Double?
    public var precipIntensityMax: Double?
    public var precipIntensityMaxTime: Date?
    public var precipProbability: Double?
    public var precipType: String?
    public var precipAccumulation: Double?
    public var temperature: Double?
    public var temperatureMin: Double?
    public var temperatureMinTime: Date?
    public var temperatureMax: Double?
    public var temperatureMaxTime: Date?
    public var apparentTemperature: Double?
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
    
    public init(time: Date? = nil, summary: String?, icon: String?, sunriseTime: Date?, sunsetTime: Date?, moonPhase: Double?, nearestStormDistance: Double?, nearestStormBearing: Double?, precipIntensity: Double?, precipIntensityMax: Double?, precipIntensityMaxTime: Date?, precipProbability: Double?, precipType: String?, precipAccumulation: Double?, temperature: Double?, temperatureMin: Double?, temperatureMinTime: Date?, temperatureMax: Double?, temperatureMaxTime: Date?, apparentTemperature: Double?, apparentTemperatureMin: Double?, apparentTemperatureMinTime: Date?, apparentTemperatureMax: Double?, apparentTemperatureMaxTime: Date?, dewPoint: Double?, windSpeed: Double?, windBearing: Double?, cloudCover: Double?, humidity: Double?, pressure: Double?, visibility: Double?, ozone: Double?) {

        self.time = time ?? nil
        self.summary = summary ?? nil
        self.icon = icon ?? nil
        self.sunriseTime = sunriseTime ?? nil
        self.sunsetTime = sunsetTime ?? nil
        self.moonPhase = moonPhase ?? nil
        self.nearestStormDistance = nearestStormDistance ?? nil
        self.nearestStormBearing = nearestStormBearing ?? nil
        self.precipIntensity = precipIntensity ?? nil
        self.precipIntensityMax = precipIntensityMax ?? nil
        self.precipIntensityMaxTime = precipIntensityMaxTime ?? nil
        self.precipProbability = precipProbability ?? nil
        self.precipType = precipType ?? nil
        self.precipAccumulation = precipAccumulation ?? nil
        self.temperature = temperature ?? nil
        self.temperatureMin = temperatureMin ?? nil
        self.temperatureMinTime = temperatureMinTime ?? nil
        self.temperatureMax = temperatureMax ?? nil
        self.temperatureMaxTime = temperatureMaxTime ?? nil
        self.apparentTemperature = apparentTemperature ?? nil
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

extension WeatherHourData: JSONDecodable {
    
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
        self.temperature = try? decoder.decode(key: "temperature")
        self.nearestStormDistance = try? decoder.decode(key: "nearestStormDistance")
        self.nearestStormBearing = try? decoder.decode(key: "nearestStormBearing")
        self.precipIntensity = try? decoder.decode(key: "precipIntensity")
        self.precipIntensityMax = try? decoder.decode(key: "precipInensityMax")
        self.precipIntensityMaxTime = try? decoder.decode(key: "precipIntensityMaxTime")
        self.precipProbability = try? decoder.decode(key: "precipProbability")
        self.precipType = try? decoder.decode(key: "precipType")
        self.precipAccumulation = try? decoder.decode(key: "precipAccumulation")
        self.temperature = try? decoder.decode(key: "temperature")
        self.temperatureMin = try? decoder.decode(key: "temperatureMin")
        self.temperatureMinTime = try? decoder.decode(key: "temperatureMinTime")
        self.temperatureMax = try? decoder.decode(key: "temperatureMax")
        self.temperatureMaxTime = try? decoder.decode(key: "temperatureMaxTime")
        self.apparentTemperature = try? decoder.decode(key: "apparentTemperature")
        self.apparentTemperatureMin = try? decoder.decode(key: "apparentTemperatureMin")
        self.apparentTemperatureMinTime = try? decoder.decode(key: "apparentTemperatureMinTime")
        self.apparentTemperatureMax = try? decoder.decode(key: "apparentTemperatureMax")
        self.apparentTemperatureMaxTime = try? decoder.decode(key: "apparentTemperatureMaxTime")
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

