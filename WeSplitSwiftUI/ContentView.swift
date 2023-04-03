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
    @FocusState private var amountIsFocused: Bool
    
    private let tipPrecenteges = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentaage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalPlusTipamount: Int {
        let checkAmountInt = Int(checkAmount)
        let tipSelection = Int(tipPercentaage)
        let tipValue = checkAmountInt / 100 * tipSelection
        let grandTotal = checkAmountInt + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<99) {
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
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                } header: {
                    Text("Amount Per Person")
                }
                
                Section {
                    Text("Total Amount + Tip = \(totalPlusTipamount)")
                    
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
          
        }
        
    }
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
