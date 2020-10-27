//
//  ContentView.swift
//  Temperature Converter SwiftUI
//
//  Created by Jeff Terry on 10/23/20.
//  Copyright © 2020 Jeff Terry. All rights reserved.
//


import SwiftUI


struct ContentView: View {
    @State var temperature: String = ""
        
    @State var tempC: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            fahrenheitText()
            
            fahrenheitTextField(temp: $temperature, tempC: $tempC)
            
            celsiusView(tempC: $tempC)
        }.padding()
        }

}

    
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}

struct celsiusView: View {
    @Binding var tempC: String
    var body: some View {
        Text("The Temperature in C: \(tempC)")
            .frame(width: 300, height: nil, alignment: .leading)

    }
}

struct fahrenheitTextField: View {
    @Binding var temp: String
    @Binding var tempC: String
    var body: some View {
        
        TextField("Enter temperature in °F ...", text: $temp, onEditingChanged: { (changed) in
            print("Username onEditingChanged - \(changed)")
        }){
            print("Username onCommit")
            
            if var tempDouble = Double(self.temp) {
                    tempDouble = convertToC(Temp: (tempDouble))
                
                    self.tempC = String(format: "%.02f °C", tempDouble)
            } else {
                
                self.tempC = ""

            }
        
            
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 220, height: nil)
       // .border(Color.purple)
    
        //.padding(.all, 5)
     
    }
    
    
}


struct fahrenheitText: View {
    var body: some View {
        Text("Temperature in °F")
        
    }
}


func convertToC(Temp: Double) -> Double {
    
    var TempCelsius = 0.0
    
    TempCelsius = 5.0/9.0 * (Temp - 32.0)
    
   // self.tempC = "\(TempCelsius)"
    
    return(TempCelsius)
    
}
