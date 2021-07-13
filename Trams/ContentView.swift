//
//  ContentView.swift
//  Trams
//
//  Created by Terran Kroft on 7/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            NavigationView {
            TramDashboardView()
            }
                .tabItem {
                    Label("Routes", systemImage: "circle.grid.2x2")
                }
            BlankView()
                .tabItem {
                    Label("Something", systemImage: "list.dash")
                }
            
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
