//
//  CategoryDataSource.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 16.03.2023.
//

import Foundation
import UIKit

struct Category: Hashable {
    let name, imageName: String
    
   static let categories: [Category] = [
        .init(name: "Phones", imageName: "iphone.gen1"),
        .init(name: "Headphones", imageName: "headphones"),
        .init(name: "Games", imageName: "gamecontroller.fill"),
        .init(name: "Cars", imageName: "car.side.fill"),
        .init(name: "Furniture", imageName: "bed.double.fill"),
        .init(name: "Kids", imageName: "teddybear.fill"),
    ]
}


