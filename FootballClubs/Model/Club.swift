//
//  Club.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 7. 11. 2021..
//

import Foundation
import UIKit

class Team: Codable {
    let id: Int
    let name: String
    let crestUrl: String?
}

class TeamsResponse: Codable {
    let count: Int
    let teams: [Team]
}
