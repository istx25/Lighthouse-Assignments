//
//  Meal.swift
//  FoodTracker
//
//  Created by Willow Belle on 2015-11-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {

    // MARK: Properties
    var name: String
    var rating: Int
    var photo: UIImage?

    struct PropertyKey {
        static let nameKey = "name"
        static let ratingKey = "rating"
        static let photoKey = "photo"
    }

    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")

    // MARK: Initialization
    init?(name: String, rating: Int, photo: UIImage?) {
        self.name = name
        self.rating = rating
        self.photo = photo

        super.init()

        if name.isEmpty || rating < 0 {
            return nil
        }
    }

    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)

        self.init(name: name, rating: rating, photo: photo)
    }
}
