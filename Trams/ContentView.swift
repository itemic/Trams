//
//  ContentView.swift
//  Trams
//
//  Created by Terran Kroft on 7/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView {
            TramDashboardView()
        }
        
        
    }
}

struct BlankView: View {
    var body: some View {
        Text("blank!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
