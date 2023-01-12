//
//  TextField.swift
//  ColorChangerSwiftUI
//
//  Created by Stanislav Demyanov on 12.01.2023.
//

import SwiftUI

struct ColorTextField: View {
    
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation {
                checkValue()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please enter value from 0 to 255")
        }
    }
}

extension ColorTextField {
    private func checkValue() {
        if let value = Int(textValue),
           (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorTextField(textValue: .constant("128"),
                           value: .constant(128))
        }
    }
}
