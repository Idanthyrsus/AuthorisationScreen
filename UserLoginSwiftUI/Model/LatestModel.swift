//
//  LatestModel.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 13.03.2023.
//

import Foundation

// MARK: - LatestElement
struct LatestElement: Codable, Identifiable {
    let category, name: String?
    let price: Int?
    let imageURL: String?

    var id: String {
        return UUID().uuidString
    }

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
