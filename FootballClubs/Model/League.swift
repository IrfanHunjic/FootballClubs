//
//  League.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 7. 11. 2021..
//

import Foundation
import UIKit

class League: Codable {
    let id: Int
    let name: String
    let emblemUrl: String?
}

class LeaguesResponseModel: Codable {
    let count: Int
    let competitions: [League]
}

