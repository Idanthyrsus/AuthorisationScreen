//
//  AccountDetails+CoreDataProperties.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 18.03.2023.
//
//

import Foundation
import CoreData


extension AccountDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountDetails> {
        return NSFetchRequest<AccountDetails>(entityName: "AccountDetails")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?

}

extension AccountDetails : Identifiable {

}
