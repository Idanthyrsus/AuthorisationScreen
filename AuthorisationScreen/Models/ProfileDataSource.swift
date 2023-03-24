//
//  ProfileDataSource.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

struct ProfileDataSource: Identifiable {
    
    private enum IconChoices {
        case pay
        case restore
        case help
        case logout
        
        var description: String {
            switch self {
            case .pay:
                return "Creditcard"
            case .restore:
                return "Restore"
            case .help:
                return "Questionmark"
            case .logout:
                return "Logout"
            }
        }
    }
    
    public var id: String {
        category
    }
    let image: String
    let category: String
    let rightElement: String?
    
   static var dataSourceArray: [ProfileDataSource] = [
    ProfileDataSource(image: IconChoices.pay.description, category: "Trade store", rightElement: "chevron.right"),
    ProfileDataSource(image: IconChoices.pay.description, category: "Payment method", rightElement: "chevron.right"),
    ProfileDataSource(image: IconChoices.pay.description, category: "Balance", rightElement: nil),
    ProfileDataSource(image: IconChoices.pay.description, category: "Trade history", rightElement: "chevron.right"),
    ProfileDataSource(image: IconChoices.restore.description, category: "Restore purchase", rightElement: "chevron.right"),
    ProfileDataSource(image: IconChoices.help.description, category: "Help", rightElement: nil),
    ProfileDataSource(image: IconChoices.logout.description, category: "Log out", rightElement: nil),
    ]
    
    static var balanceDataSource: Double = 1593
}
