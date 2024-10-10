//
//  TextView.swift
//  GuessNumber
//
//  Created by Евгений on 10.10.2024.
//

import SwiftUI

struct TextView: View {
    var targetValue: Int
    
    var body: some View {
        Text(
            String(
                format: "Подвиньте слайдер, как можно ближе к: \(targetValue)"
            )
        )
    }
}

#Preview {
    TextView(targetValue: 0)
}
