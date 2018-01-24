import Foundation

public struct WeatherHourData {
    
    //public let time: Date
    public let windSpeed: Double
    public let temperature: Double
    public let precipitation: Double
    public let humidity: Double
    
    public init(windSpeed: Double, temperature: Double, precipitation: Double, humidity: Double) {
        //self.time = time
        self.windSpeed = windSpeed
        self.temperature = temperature
        self.precipitation = precipitation
        self.humidity = humidity
    }
    
}

extension WeatherHourData: JSONDecodable {
    
    public init(decoder: JSONDecoder) throws {
        self.windSpeed = try decoder.decode(key: "windSpeed")
        self.temperature = try decoder.decode(key: "temperature")
        self.precipitation = try decoder.decode(key: "precipIntensity")
        self.humidity = try decoder.decode(key: "humidity")
        
        //let time: Double = try decoder.decode(key: "time")
        //self.time = Date(timeIntervalSince1970: time)
    }
    
}
