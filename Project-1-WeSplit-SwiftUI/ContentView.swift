//
//  ContentView.swift
//  Project-1-WeSplit-SwiftUI
//
//  Created by Baris Karalar on 4.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var noOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Check Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $noOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(checkAmount)")
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
