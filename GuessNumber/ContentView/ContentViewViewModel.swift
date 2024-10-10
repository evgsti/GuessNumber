//
//  ContentViewViewModel.swift
//  GuessNumber
//
//  Created by Евгений on 10.10.2024.
//

import Foundation
import Observation

@Observable
final class ContentViewViewModel {
    var targetValue = 0
    var currentValue = 0.0
    var alphaComponent: Double {
        Double(computeScore()) / 100
    }
    
    func restartGame() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        
        print("target: \(Int(targetValue)), current: \(String(format: "%.0f", currentValue))")
        
        return 100 - difference
    }
}
