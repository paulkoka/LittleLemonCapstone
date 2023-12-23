//
//  Onboarding.swift
//  LittleLemonCapstone
//
//  Created by Paul Koka on 23.08.23.
//

import SwiftUI

struct Onboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            LittleLemonLogo()
            Text("To make you experience better, please register")
                .foregroundColor(Color.secondaryGreen)
                .font(.system(size: 30))
            Form {
                TitledTextField(
                    text: $viewModel.firstName,
                    title: "First Name"
                )
                TitledTextField(
                    text: $viewModel.lastName,
                    title: "Last Name"
                )
                TitledTextField(
                    text: $viewModel.email,
                    title: "Email",
                    keyboardStyle: .emailAddress
                )
            }
            .scrollContentBackground(.hidden)
            registerButton()
        }
        .alert("ERROR", isPresented: $viewModel.showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage)
        })
    }
    
    
    private func registerButton() -> some View {
        Button {
            viewModel.regster()
        } label: {
            Text("Register")
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                .foregroundColor(.black)
                .background(Color.primaryYellow)
                .cornerRadius(20)
        }
        .padding(.horizontal, 16)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(viewModel: OnboardingViewModel())
    }
}
