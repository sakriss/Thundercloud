import Foundation

public struct DailyData {
    
    public let lat: Double
    public let long: Double
    
    public let dailyData: [WeatherDailyData]
    
    public init(lat: Double, long: Double, dailyData: [WeatherDailyData]) {

        self.lat = lat
        self.long = long
        self.dailyData = dailyData
    }

}

extension DailyData: JSONDecodable {
    
    public init(decoder: JSONDecoder) throws {
//        let jsonData = try! JSONSerialization.data(withJSONObject: decoder.JSONData, options: .prettyPrinted)
//        let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!.replacingOccurrences(of: "\\n", with: "\n").replacingOccurrences(of: "\\\"", with: "\"")
//        print(jsonString)
    
        self.lat = try decoder.decode(key: "latitude")
        self.long = try decoder.decode(key: "longitude")
        self.dailyData = (try? decoder.decode(key: "daily.data")) ?? []
    }
}

//extension Date {
//    init?(time: Double?) {
//        guard let t = time else { return nil }
//        self.init(timeIntervalSince1970: t)
//    }
//}

