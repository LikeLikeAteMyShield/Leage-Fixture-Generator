//
//  BlacklistDate.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 22/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import Foundation

public class BlacklistDate: NSObject, NSCoding {
    
    let date: NSDate
    
    struct PropertyKey {
        static let dateKey = "date"
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("blacklistDates")
    
    init(date: NSDate) {
        self.date = date
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(date, forKey: PropertyKey.dateKey)
    }
    
    required convenience public init(coder aDecoder: NSCoder) {
        
        let date = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as! NSDate
        
        self.init(date: date)
    }
}