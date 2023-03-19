//
//  FlashSaleModel.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 13.03.2023.
//

import Foundation

// MARK: - FlashSale

struct FlashSaleResponse: Codable {
    let flashSale: [FlashSaleElement]?

    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

// MARK: - FlashSaleElement
struct FlashSaleElement: Codable, Identifiable {

    var id: String {
        return UUID().uuidString
    }

    let category, name: String?
    let price: Double?
    let discount: Int?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}
