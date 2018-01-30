//
//  ForcastAlert.swift
//  Thundercloud
//
//  Created by Scott Kriss on 1/29/18.
//  Copyright © 2018 Scott Kriss. All rights reserved.
//

import Foundation

public struct ForcastAlert {
    public var title: String?
    public var regions: String?
    public var severity: String?
    public var time: Date?
    public var expires: Date?
    public var description: String?
    public var uri: String?


    public init (title: String?, regions: String?, severity: String?, time: Date?, expires: Date?, description: String?, uri: String?) {
    
        self.title = title ?? nil
        self.regions = regions ?? nil
        self.severity = severity ?? nil
        self.time = time ?? nil
        self.expires = expires ?? nil
        self.description = description ?? nil
        self.uri = uri ?? nil
        
    }
}
