//
//  LatestModel.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 17.03.2023.

import Foundation

struct LatestResponse: Codable {
    let latest: [LatestElement]
}

// MARK: - LatestElement
struct LatestElement: Codable {
    let category, name: String?
    let price: Int?
    let imageUrl: String?
}
