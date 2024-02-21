//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Daniel Moura on 11/02/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    init() {
        retrieveUser()
    }
    
    func onSaveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
       
        return true
    }
    
    func saveUserRequests() {
        guard let savedUserData = userData else { return }
        var savedUser = User()
        do {
            savedUser = try JSONDecoder().decode(User.self, from: savedUserData)
        } catch {}
        
        var newUser = savedUser
        newUser.extraNapkins = user.extraNapkins
        newUser.frequentRefills = user.frequentRefills
        
        do {
            let data = try JSONEncoder().encode(newUser)
            userData = data
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
 }
