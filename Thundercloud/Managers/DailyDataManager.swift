//
//  DailyDataManager.swift
//  Thundercloud
//
//  Created by Scott Kriss on 1/29/18.
//  Copyright © 2018 Scott Kriss. All rights reserved.
//

import Foundation

enum DailyDataManagerError: Error {
    
    case Unknown
    case FailedRequest
    case InvalidResponse
    
}

final class DailyDataManager {
    
    typealias DailyWeatherDataCompletion = (AnyObject?, DataManagerError?) -> ()
    
    let baseURL: URL
    
    // MARK: - Initialization
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Requesting Data
    
    func DailyweatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping DailyWeatherDataCompletion) {
        // Create URL
        let URL = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        
        // Create Data Task
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }.resume()
    }
    
    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: DailyWeatherDataCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processWeatherData(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }
            
        } else {
            completion(nil, .Unknown)
        }
    }
    
    private func processWeatherData(data: Data, completion: DailyWeatherDataCompletion) {
        do {
            let decoder = try JSONDecoder(data: data)
            
            if let dailydata = try? DailyData(decoder: decoder) as AnyObject {
                print("completion incoming")
                completion(dailydata, nil)
                print(dailydata)
            } else {
                print("DailyData is nil")
                completion(nil, .InvalidResponse)
            }
            
        } catch {
            print("bad things")
        }
        
        
                if let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject {
                    completion(JSON, nil)
                } else {
                    completion(nil, .InvalidResponse)
                }
    }
    
}
