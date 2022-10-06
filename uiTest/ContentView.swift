//
//  ContentView.swift
//  uiTest
//
//  Created by justin reid on 10/4/22.
//

import SwiftUI
import Haptica

struct ContentView: View {
    
    @State private var fadeInOut = false
    @State private var Counter: Int = 0
    @State var showAlert = false
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10, content:  {
            
            if (Counter <= 9) && (Counter >= 0) {
                Text(" ")
                    .offset(y: -100)
                    .font(.system(size:48))
                    .padding(10.0)
                    .onAppear()
                {
                }.opacity(fadeInOut ? 0 : 1)
            }
            
            else if (Counter >= 10) && (Counter <= 19) {
                Text("🎉")
                    .offset(y: -100)
                    .font(.system(size:48))
                    .padding(10.0)
                    .onAppear()
                {
                    withAnimation(Animation.easeInOut(duration:2.5)){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 0 : 1)
            }
            else if (Counter >= 20){
                Text("🥳")
                    .offset(y: -100)
                    .font(.system(size:48))
                    .padding(10.0)
                    .onAppear()
                {
                    withAnimation(Animation.easeInOut(duration:2.5)){
                        fadeInOut.toggle()
                    }
                }.opacity(fadeInOut ? 1 : 0)
            }
        })
        
        VStack(alignment: .center, spacing: 10, content: {
            Text("\(Counter)")
                .font(.system(size:200))
                .fontWeight(.bold).padding(.vertical, 10.0)
                .shadow(color: .white, radius: 5)
            
            Button("press me") {
                Counter += 1
                Haptic.impact(.heavy).generate()
            }
        }).buttonStyle(GrowingButton())
        
        VStack(spacing: 10) {
            Button("reset") {
                while Counter != 0 {
                    repeat {
                        Haptic.impact(.light).generate()
                        Counter -= 1
                        
                    }
                    while
                        Counter != 0
                }
            }
        }.buttonStyle(ResetButton()).padding(10)

        

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
