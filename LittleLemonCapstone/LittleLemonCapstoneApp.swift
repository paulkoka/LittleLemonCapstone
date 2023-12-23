//
//  LittleLemonCapstoneApp.swift
//  LittleLemonCapstone
//
//  Created by Paul Koka on 23.08.23.
//

import SwiftUI

@main
struct LittleLemonCapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding(viewModel: OnboardingViewModel())
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
