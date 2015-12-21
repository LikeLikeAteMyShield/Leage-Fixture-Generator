//
//  League_Fixture_GeneratorTests.swift
//  League Fixture GeneratorTests
//
//  Created by Jonny Cameron on 16/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import XCTest
@testable import League_Fixture_Generator

class League_Fixture_GeneratorTests: XCTestCase {
    
    // MARK: Club tests
    
    func testClubInitialisation() {
    
        let testClub = Club(name: "Ulster Transport", hasJuniorTeam: true, hasSeniorTeam: true)
        XCTAssertNotNil(testClub)
        
        let noNameClub = Club(name: "", hasJuniorTeam: true, hasSeniorTeam: true)
        XCTAssertNil(noNameClub, "Empty name is invalid")
        
        let noTeamClub = Club(name: "Ulster Transport", hasJuniorTeam: false, hasSeniorTeam: false)
        XCTAssertNil(noTeamClub)
    }
}
