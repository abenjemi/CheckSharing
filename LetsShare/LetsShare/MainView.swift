//
//  MainView.swift
//  LetsShare
//
//  Created by Amine Ben Jemia on 2/26/22.
//

import SwiftUI

struct MainView: View {
    
    @State private var name = "Amine"
    @State private var checkAmount = 0.0
    @State private var tipAmount = 0
    @State private var numberOfPeople = 0
    @State private var showAlert = false
    private var tips = [0, 10, 15, 20, 25]
    @State private var tipSelected = 0
    var finalAmount:Double {
        let tipFact = checkAmount / 100 * Double(tipSelected)
        let total = tipFact + checkAmount
        let people = Double(numberOfPeople + 2)
        let finalResult = total / people
        return finalResult
    }
    
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("check amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Number of people sharing", selection: $numberOfPeople) {
                        ForEach(2..<20) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    HStack {
                        Picker("tip amount", selection: $tipSelected) {
                            ForEach(tips, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                } header: {
                    Text("How much tip do you want to give")
                }
                
                Section {
                    Text(finalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total per Person:")
                }
            }
            .navigationTitle("Let's Share")
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
