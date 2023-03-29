//
//  HeaderModel.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 18.03.2023.
//

import Foundation

struct HeaderModel {
    let leftLabel: String
    let rightLabel: String
    
    static var headerArray: [HeaderModel] = [
    HeaderModel(leftLabel: "Latest", rightLabel: "View all"),
    HeaderModel(leftLabel: "Flash Sale", rightLabel: "View all"),
    HeaderModel(leftLabel: "Brands", rightLabel: "View all")
    ]
}
