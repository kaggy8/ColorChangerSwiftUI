//
//  ContentView.swift
//  ColorChangerSwiftUI
//
//  Created by Stanislav Demyanov on 12.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var focusField: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0,
                                    green: 0.23,
                                    blue: 0.66,
                                    alpha: 1)).ignoresSafeArea()
                
                VStack(spacing: 40) {
                    ColorView(red: red, green: green, blue: blue)
                    
                    VStack {
                        SliderView(sliderValue: $red, color: .red)
                        SliderView(sliderValue: $green, color: .green)
                        SliderView(sliderValue: $blue, color: .blue)
                    }
                    .frame(height: 150)
                    .focused($focusField)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                focusField = false
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
