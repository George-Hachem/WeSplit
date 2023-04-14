//
//  ContentView.swift
//  WeSplit
//
//  Created by George on 4/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerson: Double{
        let peopleCount = Double(numberOfPeople + 1)
        let tip = Double(tipPercentage)
        let tipValue = checkAmount/100 * tip
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
        
    }
    var body: some View {
        
        NavigationView{
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people:", selection: $numberOfPeople){
                        ForEach(1..<11){
                            Text("\($0) people")
                        }
                    }
                    
                }
                Section{
                    Picker("Tip Percentages", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Tip Percentage")
                }
                Section{
                    Text(totalPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }header: {
                    Text("Split")
                }
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .keyboard){
                        Spacer()
                        Button("Done"){
                            amountIsFocused = false
                        }
                    }
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
