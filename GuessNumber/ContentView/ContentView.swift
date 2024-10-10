//
//  ContentView.swift
//  GuessNumber
//
//  Created by Евгений on 10.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var contentViewVM = ContentViewViewModel()
    @State private var showAlert = false
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 30) {
            TextView(targetValue: contentViewVM.targetValue)
            
            UISliderRepresentation(
                currentValue: $contentViewVM.currentValue,
                thumbSliderAlpha: contentViewVM.alphaComponent
            )
            
            ButtonView(
                title: "Проверь меня!",
                action: {
                    score = contentViewVM.computeScore()
                    showAlert.toggle()
                }
            )
            .alert("Ваши очки: \(score)", isPresented: $showAlert, actions: {}) {
                Text("Вы выбрали: \(String(format: "%.0f", contentViewVM.currentValue))")
            }
            
            ButtonView(
                title: "Начать заново",
                action: contentViewVM.restartGame
            )
        }
        .padding()
        .onAppear {
            contentViewVM.restartGame()
        }
    }
}

#Preview {
    ContentView()
}
