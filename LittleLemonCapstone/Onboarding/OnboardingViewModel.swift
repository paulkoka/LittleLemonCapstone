//
//  OnboardingViewModel.swift
//  LittleLemonCapstone
//
//  Created by Paul Koka on 23.08.23.
//

import Foundation

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

class OnboardingViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    private(set) var errorMessage: String = ""
    @Published var showFormInvalidMessage = false
    
    func regster() {
        guard isValid(name: firstName)
                && isValid(name: lastName)
                && isValid(email: email) else {
            var invalidNameMessage = ""
            if !isValid(name: firstName) {
                invalidNameMessage = "First Name can only contain letters and must have at least 2 characters\n\n"
            }
            
            var invalidLastNameMessage = ""
            if !isValid(name: lastName) {
                invalidLastNameMessage = "Last Name can only contain letters and must have at least 2 characters\n\n"
            }
            
            var invalidEmailMessage = ""
            if !isValid(email: email) {
                invalidEmailMessage = "The e-mail is invalid and cannot be blank."
            }
            
            errorMessage = "Found these errors in the form:\n\n \(invalidNameMessage)\(invalidLastNameMessage)\(invalidEmailMessage)"
            
            showFormInvalidMessage.toggle()
            return
        }
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
    }
    
    private func isValid(name: String) -> Bool {
        guard !name.isEmpty,
              name.count > 2
        else { return false }
        // customerName must contain just letters
        for chr in name {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    private func isValid(email:String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}
