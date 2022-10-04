//
//  ContentView.swift
//  uiTest
//
//  Created by justin on 10/4/22.
//

import SwiftUI
import Haptica

struct ContentView: View {
    var body: some View {
        Button("BUTTON") {
            Haptic.impact(.heavy).generate()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
