//
//  TramDashboardView.swift
//  Trams
//
//  Created by Terran Kroft on 7/13/21.
//

import SwiftUI




struct TramDashboardView: View {
    @State private var query = ""
    @State private var showSheet = false
    let trams = ["1", "3", "3a", "5", "5a", "6", "11",
                 "12", "16", "19", "30", "35", "48", "57", "58", "59", "64", "67", "70", "72", "75", "78", "82", "86", "86a", "96", "109"]
    let columns = [GridItem(.adaptive(minimum: 150)), GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ZStack {
            Color.brown.opacity(0.2).ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(trams, id: \.self) { item in
                        
                        TramRouteButtonView(name: item)
                        
                    }
                }
                .padding(.horizontal)
            }
        
            .navigationTitle("Routes").navigationBarTitleDisplayMode(.large)
            
        }
        .searchable(text: $query)
        .onChange(of: query) {print($0)}
    }
}

struct TramRouteButtonView: View {
    let color: Color = .random
    var name: String
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                ZStack(alignment: .center) {
                    Text("000").hidden()
                    Text(name)
                }
                
                .font(Font.system(.title3).bold().monospacedDigit())
                .padding(4)
                .background(
                    
                        RoundedRectangle(cornerRadius: 10, style: .continuous).fill(color.opacity(0.3))
                    
                )
                
                Spacer()
//                Image(systemName: "star")
            }
            
            Text("Melbourne University - Malvern East")
                .font(Font.system(.callout))
                .tracking(-0.5)
            
        }
        
        
        .foregroundColor(.primary)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.brown.opacity(0.3)))
        
    }
}

struct TramDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        TramDashboardView()
    }
}
