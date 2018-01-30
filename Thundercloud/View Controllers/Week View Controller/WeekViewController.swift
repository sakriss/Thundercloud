//
//  WeekViewController.swift
//  Thundercloud
//
//  Created by Scott Kriss on 1/22/18.
//  Copyright © 2018 Scott Kriss. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {

    
    private let dailyDataManager = DailyDataManager(baseURL: API.AuthenticatedBaseURL)
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.text = "I'm the WEEK view"
        self.view.addSubview(label)
        
        setupView()
        
        // Fetch Weather Data
        dailyDataManager.DailyweatherDataForLocation(latitude: Defaults.Latitude, longitude: Defaults.Longitude) { (response, error) in
            print("===========printing respons===========")
            print(response!)
        }
        //label.text = DailyData.init(decoder: )
    }
    
    // MARK: - View Methods
    private func setupView() {
        
    }

}
