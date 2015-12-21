//
//  Club.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 16/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

public class Club: NSObject, NSCoding {

    let name : String
    let hasJuniorTeam : Bool
    let hasSeniorTeam : Bool
    
    struct PropertyKey {
        static let nameKey = "name"
        static let juniorKey = "junior"
        static let seniorKey  = "senior"
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("clubs")
    
    init?(name:String, hasJuniorTeam:Bool, hasSeniorTeam:Bool) {
    
        self.name = name
        self.hasJuniorTeam = hasJuniorTeam
        self.hasSeniorTeam = hasSeniorTeam
        
        super.init()
        
        if name.isEmpty || (!hasSeniorTeam && !hasJuniorTeam) {
            return nil
        }
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(hasJuniorTeam, forKey: PropertyKey.juniorKey)
        aCoder.encodeObject(hasSeniorTeam, forKey: PropertyKey.seniorKey)
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
    
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let hasJunior = aDecoder.decodeObjectForKey(PropertyKey.juniorKey) as! Bool
        let hasSenior = aDecoder.decodeObjectForKey(PropertyKey.seniorKey) as! Bool
        
        self.init(name: name, hasJuniorTeam: hasJunior, hasSeniorTeam: hasSenior)
    }
}
