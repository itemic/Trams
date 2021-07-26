//
//  TramModel.swift
//  TramModel
//
//  Created by Terran Kroft on 7/26/21.
//

import Foundation
import SwiftUI

struct TramRoute: Identifiable {
    // temporary before api
    let nightTrams = ["19", "67", "75", "86", "96", "109"]
    let blackText = ["1", "3", "3a", "11", "16", "57", "70", "72", "75", "78", "82", "86"]
    
    var routeNumber: String
    var routeName: String
    var routeColor: Color
    
    var id: String {
        routeNumber
    }
    var night: Bool {
        nightTrams.contains(id)
    }
    
    var textColor: Color {
        if (blackText.contains(id)) { return Color.black } else { return Color.white}
    }
}


