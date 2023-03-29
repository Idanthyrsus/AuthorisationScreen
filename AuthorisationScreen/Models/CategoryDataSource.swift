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
        .init(name: "Phones", imageName: "Phones"),
        .init(name: "Headphones", imageName: "Headphones"),
        .init(name: "Games", imageName: "Games"),
        .init(name: "Cars", imageName: "Cars"),
        .init(name: "Furniture", imageName: "Furniture"),
        .init(name: "Kids", imageName: "Kids"),
    ]
}


