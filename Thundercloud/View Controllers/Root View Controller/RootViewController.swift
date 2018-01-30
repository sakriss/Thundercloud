//
//  RootViewController.swift
//  Thundercloud
//
//  Created by Scott Kriss on 1/22/18.
//  Copyright © 2018 Scott Kriss. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    enum RootViewType: Int {
        case now = 0
        case day
        case week
        
        static var count: Int {
            return RootViewType.week.rawValue + 1
        }
        
    }
    
    var aspectRatio: CGFloat {
        switch traitCollection.horizontalSizeClass {
        case .compact:
            return 1.0
        default:
            return 1.0 / 3.0
        }
    }
    
    let minimumInteritemSpacingForSection: CGFloat = 0.0
    let minimumLineSpacingForSection: CGFloat = 0.0
    let insetForSection = UIEdgeInsets()
    
    private let dataManager = DataManager(baseURL: API.AuthenticatedBaseURL)
    
    //@IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // Fetch Weather Data
        //dataManager.weatherDataForLocation(latitude: Defaults.Latitude, longitude: Defaults.Longitude) { (response, error) in
        //    print(response)
        //}
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RootViewType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = RootViewType(rawValue: indexPath.item) else {
            fatalError()
        }
        
        switch type {
        case .now:
            // Dequeue Reusable Cell
            return collectionView.dequeueReusableCell(withReuseIdentifier: NowCollectionViewCell.reuseIdentifier, for: indexPath)
        case .day:
            // Dequeue Reusable Cell
            return collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.reuseIdentifier, for: indexPath)
        case .week:
            // Dequeue Reusable Cell
            return collectionView.dequeueReusableCell(withReuseIdentifier: WeekCollectionViewCell.reuseIdentifier, for: indexPath)
        }
    }
    
    // MARK: - Collection View Delegate Flow Layout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        
        return CGSize(width: (bounds.width * aspectRatio), height: bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForSection
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(NowCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NowCollectionViewCell.reuseIdentifier)
        collectionView.register(DayCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        collectionView.register(WeekCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: WeekCollectionViewCell.reuseIdentifier)
        
    }
}

