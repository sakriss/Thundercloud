import Foundation

public struct WeatherData {
    
    public let lat: Double
    public let long: Double
    
    public let hourData: [WeatherHourData]
    public let currentData: [WeatherHourData]
    public let minuteData: [WeatherHourData]
    public let dailyData: [WeatherHourData]
    
//    public init(lat: Double, long: Double, hourData: [WeatherHourData], currentlyData: [WeatherHourData], minutelyData: [WeatherHourData], dailyData: [WeatherHourData]) {
}

extension WeatherData: JSONDecodable {
    
    public init(decoder: JSONDecoder) throws {
//        let jsonData = try! JSONSerialization.data(withJSONObject: decoder.JSONData, options: .prettyPrinted)
//        let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\\"", with: "\"")
//        print(jsonString)
        self.minuteData = (try? decoder.decode(key: "minutely.data")) ?? []
        self.lat = try decoder.decode(key: "latitude")
        self.long = try decoder.decode(key: "longitude")
        self.hourData = (try? decoder.decode(key: "hourly.data")) ?? []
        self.currentData = (try? decoder.decode(key: "currently")) ?? []
        self.dailyData = (try? decoder.decode(key: "daily.data")) ?? []
    }
}

//extension Date {
//    init?(time: Double?) {
//        guard let t = time else { return nil }
//        self.init(timeIntervalSince1970: t)
//    }
//}

