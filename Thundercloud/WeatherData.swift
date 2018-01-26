import Foundation

public struct WeatherData {
    
    public let lat: Double
    public let long: Double
    
    public let hourData: [WeatherHourData]
//    public let currentlyData: [WeatherHourData]
//    public let minutelyData: [WeatherHourData]
    public let dailyData: [WeatherHourData]
    
//    public init(lat: Double, long: Double, hourData: [WeatherHourData], currentlyData: [WeatherHourData], minutelyData: [WeatherHourData], dailyData: [WeatherHourData]) {
    public init(lat: Double, long: Double, hourData: [WeatherHourData], dailyData: [WeatherHourData]) {
        self.lat = lat
        self.long = long
        self.hourData = hourData
        //self.currentlyData = currentlyData
        //self.minutelyData = minutelyData
        self.dailyData = dailyData
    }
}

extension WeatherData: JSONDecodable {
    
    public init(decoder: JSONDecoder) throws {
        //self.minutelyData = try decoder.decode(key: "minutely.data")
        self.lat = try decoder.decode(key: "latitude")
        self.long = try decoder.decode(key: "longitude")
        self.hourData = try decoder.decode(key: "hourly.data")
        //self.currentlyData = try decoder.decode(key: "currently.data")
        self.dailyData = try decoder.decode(key: "daily.data")
    }
}

//extension Date {
//    init?(time: Double?) {
//        guard let t = time else { return nil }
//        self.init(timeIntervalSince1970: t)
//    }
//}

