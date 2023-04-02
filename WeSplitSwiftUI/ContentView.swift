//
//  ContentView.swift
//  WeSplitSwiftUI
//
//  Created by Vladlens Kukjans on 01/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentaage = 20
    
    private let tipPrecenteges = [10, 15, 20, 25, 0]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<99) {
                            Text("\($0) people")
                        }
                    }
                }
            
                Section {
                    Picker("Tip percentages", selection: $tipPercentaage) {
                        ForEach(tipPrecenteges, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leav?") 
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
            }
            .navigationTitle("WeSplit")
        }
        
    }
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
