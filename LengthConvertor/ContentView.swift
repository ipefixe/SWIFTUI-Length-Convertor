//
//  ContentView.swift
//  LengthConvertor
//
//  Created by Kevin Boulala on 22/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValueString = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    private var inputValue: String {
        let inputValue = Double(inputValueString) ?? 0.0
        return Measurement(value: inputValue, unit: unitLength[inputUnit]).description
    }
    
    private var outputValue: String {
        let inputValue = Double(inputValueString) ?? 0.0
        let value = Measurement(value: inputValue, unit: unitLength[inputUnit])
        return value.converted(to: unitLength[outputUnit]).description
    }
    
    private let units = ["Meter", "KM", "Feet", "Yards", "Miles"]
    private let unitLength = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Value to convert")) {
                    TextField("Value to convert", text: $inputValueString)
                        .keyboardType(.decimalPad)
                    Picker("Units", selection: $inputUnit) {
                        ForEach(0 ..< unitLength.count) {
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.textCase(.none)
                
                Section(header: Text("Conversion to")) {
                    Picker("Units", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("\(inputValue) = \(outputValue)")
                }.textCase(.none)
            }
            .navigationBarTitle("Length Convertor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
