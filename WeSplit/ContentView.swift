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
    
    var totalcheck: Double{
        let peopleCount = Double(numberOfPeople + 1)
        let tip = Double(tipPercentage)
        let tipValue = checkAmount/100 * tip
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double{
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
//                        ForEach(tipPercentages, id: \.self){
//                            Text($0, format: .percent)
//                        }
                        // Change percentage format and add more options
                        ForEach(0..<101){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }header: {
                    Text("Tip Percentage").font(.system(size: 20, weight: .bold, design: .monospaced))
                }
                Section{
                    Text(totalcheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }header:{
                    Text("Total Check").font(.system(size: 20, weight: .bold, design: .monospaced))
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }header: {
                    Text("Split").font(.system(size: 20, weight: .bold, design: .monospaced))
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
