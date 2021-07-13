//
//  TramDetailPageView.swift
//  Trams
//
//  Created by Terran Kroft on 7/13/21.
//

import SwiftUI

struct RouteDetailPageView: View {
    var name: String
    let color: Color = .random
    var body: some View {
        
        ScrollView {
            HStack {
                VStack {
                Text("HELLO")
                    Spacer()
                }
                Spacer()
            }
        }
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [color.opacity(0.2), color.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                color.opacity(0.1).edgesIgnoringSafeArea(.all)
            }
            
        )
        .navigationTitle(name)
    }
}

struct RouteDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailPageView(name: "3a")
    }
}
