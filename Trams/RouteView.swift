//
//  RouteView.swift
//  RouteView
//
//  Created by Terran Kroft on 7/17/21.
//

import SwiftUI

struct RouteView: View {
    var route: TramRoute
    var body: some View {
        Text("wow it's route \(route.routeNumber)")
    }
}

//struct RouteView_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteView(item: "3")
//    }
//}
