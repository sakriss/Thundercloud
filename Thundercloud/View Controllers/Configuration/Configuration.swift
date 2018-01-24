//
//  Configuration.swift
//  Thundercloud
//
//  Created by Scott Kriss on 1/22/18.
//  Copyright © 2018 Scott Kriss. All rights reserved.
//

import Foundation

struct API {
    
    static let APIKey = "f7bc7a2bca5a3df8d3492ec37f730f60"
    static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!
    
    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
}

struct Defaults {
    
    static let Latitude: Double = 47.3452
    static let Longitude: Double = -122.3124
    //static let Currently: String = "currently"
    
}
