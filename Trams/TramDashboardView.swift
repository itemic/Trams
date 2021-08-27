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
    @ObservedObject var vm = TramRoutesViewModel(client: NetworkManager())
    
    
    
    
    var searchResults: [Route] {
        if query.isEmpty {
            return vm.routes.sorted(by: {$0.route_number.localizedStandardCompare($1.route_number) == .orderedAscending})
        } else {
            return vm.routes.filter { $0.routeName.lowercased().contains(query.lowercased()) || $0.route_number.contains(query)}
        }
    }
    
    
    let columns = [GridItem(.adaptive(minimum: 150)), GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ZStack {
            Color.brown.opacity(0.2).ignoresSafeArea()
            ScrollView {
                Button("Test") {
                }.buttonStyle(.bordered)
                    .task {
                        do {
                            try await vm.load()
                        } catch {
                            print("Error")
                        }
                    }
                //                ForEach(vm.routes) {item in
                //                    Text(item.route_number)
                //                }
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(searchResults) {route in
                        NavigationLink(destination: RouteView(route: route)) {
                            TramRouteButtonView(route: route)
                        }
                    }
                }
                //                LazyVGrid(columns: columns, spacing: 10) {
                //                    ForEach(searchResults) { route in
                //
                //                        NavigationLink(destination: RouteView(route: route)) {
                //
                //                            TramRouteButtonView(route: route)
                //
                //                        }
                //
                //                    }
                //                }
                .padding(.horizontal)
            }
            
            .navigationTitle("Routes").navigationBarTitleDisplayMode(.large)
            
        }
        .searchable(text: $query)
        .onChange(of: query) {print($0)}
    }
}

struct TramRouteButtonView: View {
    var route: Route
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .center) {
                ZStack(alignment: .center) {
                    Text("000").hidden()
                    Text(route.route_number).foregroundColor(route.textColor)
                    
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
