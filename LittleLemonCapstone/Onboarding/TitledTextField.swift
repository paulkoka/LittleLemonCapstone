//
//  TitledTextField.swift
//  LittleLemonCapstone
//
//  Created by Paul Koka on 23.08.23.
//

import SwiftUI

struct TitledTextField: View {
    @Binding var text: String
    var title: String
    var keyboardStyle: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color.secondaryGreen)
                .font(.custom("Karla-Bold", size: 13))
            TextField(title, text: $text, prompt: Text("please enter your \(title.lowercased())"))
                .textFieldStyle(.roundedBorder)
        }
        .listRowSeparator(.hidden)
    }
}

struct TitledTextField_Previews: PreviewProvider {
    static var previews: some View {
        TitledTextField(text: .constant(""), title: "")
    }
}
