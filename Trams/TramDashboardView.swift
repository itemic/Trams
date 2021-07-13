//
//  TramDashboardView.swift
//  Trams
//
//  Created by Terran Kroft on 7/13/21.
//

import SwiftUI

struct TramDashboardView: View {
    let trams = ["1", "3", "3a", "5", "5a", "6", "11",
    "12", "16", "19", "30", "35", "48", "57", "58", "59", "64", "67", "70", "72", "75", "78", "82", "86", "86a", "96", "109"]
    let columns = [GridItem(.adaptive(minimum: 70, maximum: 100))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(trams, id: \.self) { item in
                    TramRouteButtonView(name: item)
                }
            }
            .padding(.horizontal)
        }
            .navigationTitle("Routes")
    }
}

struct TramRouteButtonView: View {
    let color: Color = .random
    var name: String
    var body: some View {
        Text(name)
            .font(Font.system(.title2, design: .monospaced).bold())
            .frame(width: 45, height: 30)
            .padding()
            .background(
                ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous).fill(color.opacity(0.5))
                
                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(LinearGradient(gradient: Gradient(colors: [color.opacity(0.2), color.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                    
                }
            )
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).strokeBorder(color, lineWidth: 2))
            
    }
}

struct TramDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        TramDashboardView()
    }
}
