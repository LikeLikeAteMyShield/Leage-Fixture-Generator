//
//  Club.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 16/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import Foundation

public class Club {

    let name : String
    let hasJuniorTeam : Bool
    let hasSeniorTeam : Bool
    
    init?(name:String, hasJuniorTeam:Bool, hasSeniorTeam:Bool) {
    
        self.name = name
        self.hasJuniorTeam = hasJuniorTeam
        self.hasSeniorTeam = hasSeniorTeam
        
        if name.isEmpty || (!hasSeniorTeam && !hasJuniorTeam) {
            return nil
        }
    }
}
