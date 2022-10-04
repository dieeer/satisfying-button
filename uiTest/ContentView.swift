//
//  ContentView.swift
//  uiTest
//
//  Created by justin on 10/4/22.
//

import SwiftUI
import Haptica

struct ContentView: View {
    
    @State private var Counter: Int = 0
    @State var showAlert = false
    
    var body: some View {
        VStack {
            Text("button pressed: \(Counter) times!").padding(.bottom, 10.0)
            
            Button("BUTTON") {
                Counter += 1
                Haptic.impact(.heavy).generate()
            }}.buttonStyle(GrowingButton())
        
        VStack {
            Button("reset") {
                Counter = 0
                Haptic.impact(.soft).generate()
            }
        }.buttonStyle(ResetButton())

        if (Counter >= 10) {
            Text("woohoo")
        }
        else if (Counter >= 20) {
            Text("😎")
        }

    }





    
    
    struct ResetButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.1 : 1)
                .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
        }
    }
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
