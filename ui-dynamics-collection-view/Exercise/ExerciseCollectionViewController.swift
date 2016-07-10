//
//  ExerciseCollectionViewController.swift
//  Exercise
//
//  Created by Willow Bumby on 2016-02-18.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import UIKit

class ExerciseCollectionViewController: UICollectionViewController {

    // MARK: Constants
    private static let ReuseIdentifier = "ExerciseCollectionViewCell"
    private static let CellCount: Int = 10000
    
    // MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewController.ReuseIdentifier)
        collectionView?.backgroundColor = .whiteColor()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExerciseCollectionViewController.CellCount
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ExerciseCollectionViewController.ReuseIdentifier, forIndexPath: indexPath)
        
        cell.backgroundColor = .orangeColor()
        
        return cell
    }
    
}
