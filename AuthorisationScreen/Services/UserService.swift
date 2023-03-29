//
//  UserService.swift
//  AuthorisationScreen
//


import Foundation
import UIKit

protocol UserServiceProtocol {
    func fetchUsers() -> [AccountDetails]
    func storeUserDetails(firstName: String?, lastName: String?, email: String?) -> AccountDetails
}

final class UserService: UserServiceProtocol {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func fetchUsers() -> [AccountDetails] {
        do {
            return try context.fetch(AccountDetails.fetchRequest())
        } catch let error as NSError {
            print("Error occured \(error)")
            return []
        }
    }

    func storeUserDetails(firstName: String?, lastName: String?, email: String?) -> AccountDetails {
        let newUser = AccountDetails(context: self.context)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Error occured \(error)")
        }
        return newUser
    }
}
