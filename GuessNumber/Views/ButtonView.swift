//
//  ButtonView.swift
//  GuessNumber
//
//  Created by Евгений on 10.10.2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

#Preview {
    ButtonView(title: "Button", action: {})
}
