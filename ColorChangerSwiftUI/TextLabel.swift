//
//  TextLabel.swift
//  ColorChangerSwiftUI
//
//  Created by Stanislav Demyanov on 12.01.2023.
//

import SwiftUI

struct TextLabel: View {
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct TextLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TextLabel(value: 200)
        }
    }
}
