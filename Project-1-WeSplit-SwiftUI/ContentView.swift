//
//  ContentView.swift
//  Project-1-WeSplit-SwiftUI
//
//  Created by Baris Karalar on 4.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var noOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var peopleCount : Double {
        Double(noOfPeople) ?? 2
    }
    
    var totalPerPerson: Double {
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Check Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    

                    TextField("Number of People", text: $noOfPeople)
                        .keyboardType(.numberPad)
                }

                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total amount for the check")) {
                    Text("\(totalPerPerson * (Double(noOfPeople) ?? 0 + 2.0), specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
