import Foundation

public struct WeatherHourData {
    public var time: Date?
    public var summary: String?
    public var icon: String?
    public var sunriseTime: Date?
    public var sunsetTime: Date?
    public var precipProbability: Double?
    public var precipType: String?
    public var temperature: Double?
    public var apparentTemperature: Double?
    public var dewPoint: Double?
    public var windSpeed: Double?
    public var windBearing: Double?
    public var cloudCover: Double?
    public var humidity: Double?
    public var pressure: Double?
    public var visibility: Double?
    
    public init(time: Date, windSpeed: Double, temperature: Double, precipitation: Double, humidity: Double, summary: String, icon: String, sunriseTime: Date, sunsetTime: Date, precipIntensity: Double, precipProbability: Double, precipType: String, apparentTemperature: Double, dewPoint: Double, windBearing: Double, cloudCover: Double, pressure: Double, visibility: Double) {
        
        self.time = time
        self.windSpeed = windSpeed
        self.temperature = temperature
        self.humidity = humidity
        self.summary = summary
        self.icon = icon
        self.sunriseTime = sunriseTime
        self.sunsetTime = sunsetTime
        self.precipProbability = precipProbability
        self.precipType = precipType
        self.apparentTemperature = apparentTemperature
        self.dewPoint = dewPoint
        self.windBearing = windBearing
        self.cloudCover = cloudCover
        self.pressure = pressure
        self.visibility = visibility


    }
}

extension WeatherHourData: JSONDecodable {
    
    public init(decoder: JSONDecoder) throws {
        self.windSpeed = try decoder.decode(key: "windSpeed")
        self.temperature = try decoder.decode(key: "temperature")
        self.humidity = try decoder.decode(key: "humidity")
        
        let time: Double = try decoder.decode(key: "time")
        self.time = Date(timeIntervalSince1970: time)
        
        self.summary = try decoder.decode(key: "summary")
        self.icon = try decoder.decode(key: "icon")
        
        if let sunriseTime: Double = try? decoder.decode(key: "sunriseTime") {
            self.sunriseTime = Date(timeIntervalSince1970: sunriseTime)
        }
        
        if let sunsetTime: Double = try? decoder.decode(key: "sunsetTime") {
            self.sunsetTime = Date(timeIntervalSince1970: sunsetTime)
        }

        self.precipProbability = try decoder.decode(key: "precipProbability")
        self.precipType = try decoder.decode(key: "precipType")
        self.apparentTemperature = try decoder.decode(key: "apparentTemperature")
        self.dewPoint = try decoder.decode(key: "dewPoint")
        self.windBearing = try decoder.decode(key: "windBearing")
        self.cloudCover = try decoder.decode(key: "cloudCover")
        self.pressure = try decoder.decode(key: "pressure")
        self.visibility = try decoder.decode(key: "visibility")
        
    }
    
}

