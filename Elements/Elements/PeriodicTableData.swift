//
//  PeriodicTableData.swift
//  Elements
//
//  Created by Ibraheem rawlinson on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
/* What need from postman:
 symbol
 number
 weight - atomic mass
 melting point
 boiling point
 discovery by
 */
struct PeriodicTableData: Codable {
    let atomicMass: Double?
    let boil: Double?
    let melt: Double?
    let namedBy: String?
    let number: Int?
    let symbol: String?
    enum CodingKeys: String, CodingKey{
        case atomicMass = "atomic_mass"
        case boil
        case melt
        case namedBy = "named_by"
        case number
        case symbol
    }
}
