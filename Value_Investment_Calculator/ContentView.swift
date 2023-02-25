//
//  ContentView.swift
//  Value_Investment_Calculator
//
//  Created by Javi Carlos on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var eps: String = ""
    @State private var growthRate: String = ""
    @State private var intrinsicValue: Double = 0
    
    var body: some View {
        VStack {
            Text("Intrinsic Value Calculator")
                .font(.title)
                .padding()
            Spacer()
            TextField("Enter EPS", text: $eps)
                .padding()
                .keyboardType(.decimalPad)
            TextField("Enter Growth Rate", text: $growthRate)
                .padding()
                .keyboardType(.decimalPad)
            Spacer()
            Button(action: {
                calculateIntrinsicValue()
            }) {
                Text("Calculate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
            Spacer()
            Text("Intrinsic Value: $\(String(format: "%.2f", intrinsicValue))")
                .font(.headline)
                .padding()
            Spacer()
        }
    }
    
    func calculateIntrinsicValue() {
        guard let eps = Double(eps),
              let growthRate = Double(growthRate) else {
            intrinsicValue = 0
            return
        }
        
        intrinsicValue = eps * (8 + (1.5 * growthRate)) * 4.4 / 5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
