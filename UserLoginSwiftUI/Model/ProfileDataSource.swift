//
//  TableDataSource.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 12.03.2023.
//

import Foundation
import SwiftUI

enum CategoryId: String {
    case pay
    case restore
    case help
    case logout
}

struct ProfileDataSource: Identifiable {
    
    private enum IconChoices {
        case pay
        case restore
        case help
        case logout
        
        var description: String {
            switch self {
            case .pay:
                return "creditcard"
            case .restore:
                return "repeat.circle"
            case .help:
                return "questionmark.circle"
            case .logout:
                return "rectangle.portrait.and.arrow.right"
                
            }
        }
    }
    
    public var id: String {
        category
    }
    let image: String
    let category: String
    let rightElement: String?
    let typeId: CategoryId
    
   static var dataSourceArray: [ProfileDataSource] = [
    ProfileDataSource(image: IconChoices.pay.description, category: "Trade store", rightElement: "chevron.right", typeId: .pay),
    ProfileDataSource(image: IconChoices.pay.description, category: "Payment method", rightElement: "chevron.right", typeId: .pay),
    ProfileDataSource(image: IconChoices.pay.description, category: "Balance", rightElement: "$ 1593", typeId: .pay),
    ProfileDataSource(image: IconChoices.pay.description, category: "Trade history", rightElement: "chevron.right", typeId: .pay),
    ProfileDataSource(image: IconChoices.restore.description, category: "Restore purchase", rightElement: "chevron.right", typeId: .restore),
    ProfileDataSource(image: IconChoices.help.description, category: "Help", rightElement: nil, typeId: .help),
    ProfileDataSource(image: IconChoices.logout.description, category: "Log out", rightElement: nil, typeId: .logout),
    ]
}





