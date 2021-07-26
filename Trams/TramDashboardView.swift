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
    
    let routes = [TramRoute(routeNumber: "1", routeName: "East Coburg – South Melbourne Beach", routeColor: Color(red: 181/255, green: 189/255, blue: 0/255)),
                  TramRoute(routeNumber: "3", routeName: "Melbourne University – East Malvern", routeColor: Color(red: 141/255, green: 200/255, blue: 232/255)),
                  TramRoute(routeNumber: "3a", routeName: "Melbourne University – East Malvern", routeColor: Color(red: 141/255, green: 200/255, blue: 232/255)),
                  TramRoute(routeNumber: "5", routeName: "Melbourne University – Malvern", routeColor: Color(red: 213/255, green: 0/255, blue: 50/255)),
                  TramRoute(routeNumber: "6", routeName: "Moreland – Glen Iris", routeColor: Color(red: 1/255, green: 66/255, blue: 106/255)),
                  TramRoute(routeNumber: "11", routeName: "West Preston – Victoria Harbour Docklands", routeColor: Color(red: 110/255, green: 206/255, blue: 178/255)),
                  TramRoute(routeNumber: "12", routeName: "Victoria Gardens – St Kilda", routeColor: Color(red: 0/255, green: 126/255, blue: 146/255)),
                  TramRoute(routeNumber: "16", routeName: "Melbourne University – Kew", routeColor: Color(red: 251/255, green: 216/255, blue: 114/255)),
                  TramRoute(routeNumber: "19", routeName: "North Coburg – Flinders St Station", routeColor: Color(red: 138/255, green: 27/255, blue: 97/255)),
                  TramRoute(routeNumber: "30", routeName: "St Vincent's Plaza – Central Pier Docklands", routeColor: Color(red: 83/255, green: 79/255, blue: 150/255)),
                  TramRoute(routeNumber: "35", routeName: "City Circle", routeColor: Color(red: 107/255, green: 53/255, blue: 41/255)),
                  TramRoute(routeNumber: "48", routeName: "North Balwyn – Victoria Harbour Docklands", routeColor: Color(red: 51/255, green: 52/255, blue: 52/255)),
                  TramRoute(routeNumber: "57", routeName: "West Maribyrnong – Flinder St Station", routeColor: Color(red: 0/255, green: 193/255, blue: 213/255)),
                  TramRoute(routeNumber: "58", routeName: "West Coburg – Toorak", routeColor: Color(red: 150/255, green: 150/255, blue: 150/255)),
                  TramRoute(routeNumber: "59", routeName: "Airport West – Flinders St Station", routeColor: Color(red: 0/255, green: 101/255, blue: 58/255)),
                  TramRoute(routeNumber: "64", routeName: "Melbourne University – East Brighton", routeColor: Color(red: 0/255, green: 171/255, blue: 142/255)),
                  TramRoute(routeNumber: "67", routeName: "Melbourne University – Carnegie", routeColor: Color(red: 149/255, green: 108/255, blue: 88/255)),
                  TramRoute(routeNumber: "70", routeName: "Wattle Park – Waterfront City Docklands", routeColor: Color(red: 245/255, green: 155/255, blue: 187/255)),
                  TramRoute(routeNumber: "72", routeName: "Melbourne University – Camberwell", routeColor: Color(red: 154/255, green: 190/255, blue: 170/255)),
                  TramRoute(routeNumber: "75", routeName: "Vermont South – Central Pier Docklands", routeColor: Color(red: 0/255, green: 169/255, blue: 224/255)),
                  TramRoute(routeNumber: "78", routeName: "North Richmond – Balaclava", routeColor: Color(red: 160/255, green: 160/255, blue: 214/255)),
                  TramRoute(routeNumber: "82", routeName: "Moonee Ponds – Footscray", routeColor: Color(red: 210/255, green: 215/255, blue: 85/255)),
                  TramRoute(routeNumber: "86", routeName: "Bundoora RMIT – Waterfront City Docklands", routeColor: Color(red: 255/255, green: 181/255, blue: 0/255)),
                  
                  TramRoute(routeNumber: "96", routeName: "East Brunswick – St Kilda Beach", routeColor: Color(red: 198/255, green: 0/255, blue: 126/255)),
                  TramRoute(routeNumber: "109", routeName: "Box Hill – Port Melbourne", routeColor: Color(red: 232/255, green: 119/255, blue: 34/255))]
    
    
    var searchResults: [TramRoute] {
        if query.isEmpty {
            return routes
        } else {
            return routes.filter { $0.routeName.lowercased().contains(query.lowercased()) || $0.routeNumber.contains(query)}
        }
    }
    
    
    let columns = [GridItem(.adaptive(minimum: 150)), GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ZStack {
            Color.brown.opacity(0.2).ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(searchResults) { route in
                        
                        NavigationLink(destination: RouteView(route: route)) {
                        
                            TramRouteButtonView(route: route)
                                
                        }
                        
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
    var route: TramRoute
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                ZStack(alignment: .center) {
                    Text("000").hidden()
                    Text(route.routeNumber).foregroundColor(route.textColor)
                    
                }
                
                .font(Font.system(.title3).bold().monospacedDigit())
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(route.routeColor)
                )
                Spacer()
                Image(systemName: "star")
            }
            Spacer()
            Text(route.routeName)
                .font(Font.system(.footnote)).multilineTextAlignment(.leading)
            
            
        }
        
        
        .foregroundColor(.primary)
        .padding(10)
        .frame(minHeight: 120)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.brown.opacity(0.3)))
        
    }
}

struct TramDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        TramDashboardView()
    }
}
