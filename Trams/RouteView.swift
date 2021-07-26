//
//  RouteView.swift
//  RouteView
//
//  Created by Terran Kroft on 7/17/21.
//

import SwiftUI

struct RouteView: View {
    var route: TramRoute
    @State private var direction = "A"
    @State private var selectedStop: Int?
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        ZStack(alignment: .center) {
                            Text("000").hidden()
                            Text(route.routeNumber).foregroundColor(route.textColor)
                        }
                        .font(Font.system(.title).bold().monospacedDigit())
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(route.routeColor)
                        )
                        Text(route.routeName).font(.title).bold()
                        Spacer()
                    }
                    Picker("Picker", selection: $direction) {
                        Text("to \(route.routeName.components(separatedBy: " – ").first ?? "Terminus")").tag("A")
                        Text("to \(route.routeName.components(separatedBy: " – ").last ?? "Terminus")").tag("B")
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                .background(Color.brown.opacity(0.2))
                
                List {
                    ForEach(1..<20) {stop in
                        
                        
                        HStack(alignment: .center) {
                            VStack(spacing: 0) {
                                //                            Text("STOP").font(.footnote).tracking(1)
                                ZStack(alignment: .center) {
                                    Text("000").tracking(1).hidden()
                                    Text("\(stop)").tracking(1)
                                }
                            }
                            .padding(5)
                            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).strokeBorder(route.routeColor.opacity(0.5), lineWidth: 2))
                            .font(.title3.monospacedDigit())
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Placeholder St").font(.headline)
                                
                                ZStack(alignment: .center) {
                                    Text("0000").hidden()
                                    Text(route.routeNumber).foregroundColor(route.textColor)
                                }
                                .font(Font.system(.caption2).bold().monospacedDigit())
                                //                            .padding(4)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(route.routeColor)
                                )
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedStop = stop
                        }
                        
                        
                        
                    }
                    
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
                
                
            }
            
            if let selectedStop = selectedStop {
                Text("\(selectedStop)").font(.title)
                    
                    .frame(width: 300, height: 300)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.ultraThinMaterial)
                    )
                    .padding()
                    .onTapGesture {
                        self.selectedStop = nil
                    }
                    
            }
                
            
        }
        .navigationBarTitleDisplayMode(.inline)
        //        .navigationBarHidden(true)
        
        
        
    }
}

//struct RouteView_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteView(item: "3")
//    }
//}
