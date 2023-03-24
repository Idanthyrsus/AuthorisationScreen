//
//  FlashsaleModel.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 17.03.2023.
//
import Foundation

struct FlashSaleResponse: Codable {
    let flashSale: [FlashSaleElement]?
}

// MARK: - FlashSaleElement
struct FlashSaleElement: Codable, Identifiable {
    var id: String {
        return UUID().uuidString
    }

    let category, name: String?
    let price: Double?
    let discount: Int?
    let imageUrl: String?
}
