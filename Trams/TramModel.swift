//
//  TramModel.swift
//  TramModel
//
//  Created by Terran Kroft on 7/26/21.
//

import Foundation
import SwiftUI


struct Routes: Decodable {
    var routes: [Route]
}
struct Route: Identifiable, Decodable {
    
    
    static let colorMapping: [String: Color] =
    [
        "1": Color(red: 181/255, green: 189/255, blue: 0/255),
        "3-3a": Color(red: 141/255, green: 200/255, blue: 232/255),
        "5": Color(red: 213/255, green: 0/255, blue: 50/255),
        "6": Color(red: 1/255, green: 66/255, blue: 106/255),
        "11": Color(red: 110/255, green: 206/255, blue: 178/255),
        "12":  Color(red: 0/255, green: 126/255, blue: 146/255),
        "16": Color(red: 251/255, green: 216/255, blue: 114/255),
        "19":  Color(red: 138/255, green: 27/255, blue: 97/255),
        "30": Color(red: 83/255, green: 79/255, blue: 150/255),
        "35": Color(red: 107/255, green: 53/255, blue: 41/255),
        "48": Color(red: 51/255, green: 52/255, blue: 52/255),
        "57": Color(red: 0/255, green: 193/255, blue: 213/255),
        "58": Color(red: 150/255, green: 150/255, blue: 150/255),
        "59": Color(red: 0/255, green: 101/255, blue: 58/255),
        "64": Color(red: 0/255, green: 171/255, blue: 142/255),
        "67": Color(red: 149/255, green: 108/255, blue: 88/255),
        "70": Color(red: 245/255, green: 155/255, blue: 187/255),
        "72": Color(red: 154/255, green: 190/255, blue: 170/255),
        "75": Color(red: 0/255, green: 169/255, blue: 224/255),
        "78": Color(red: 160/255, green: 160/255, blue: 214/255),
        "82": Color(red: 210/255, green: 215/255, blue: 85/255),
        "86": Color(red: 255/255, green: 181/255, blue: 0/255),
        "96":  Color(red: 198/255, green: 0/255, blue: 126/255),
        "109":  Color(red: 232/255, green: 119/255, blue: 34/255)
    ]
    static let blackText = ["1", "3-3a", "11", "16", "57", "70", "72", "75", "78", "82", "86"]
    
    var id: Int {
        route_id
    }
    
    var route_type: Int
    var route_id: Int
    var route_name: String
    var route_number: String
    
    var routeName: String {
        return route_name.replacingOccurrences(of: "  ", with: " ")
    }
    
    var routeColor: Color {
        return Route.colorMapping[route_number] ?? Color(red: 0, green: 0, blue: 0)
    }
    var textColor: Color {
        if (Route.blackText.contains(route_number)) { return Color.black } else { return Color.white}
    }
}
struct Directions: Decodable {
    var directions: [Direction]
}
struct Direction: Identifiable, Decodable {
    var direction_id: Int
    var id: Int {
        direction_id
    }
    var route_direction_description: String
    var direction_name: String
    var route_id: Int
    var route_type: Int
}

struct Stops: Decodable {
    var stops: [Stop]
}

struct Stop: Identifiable, Decodable {
    var stop_id: Int
    var id: Int {stop_id}
    var stop_name: String
    var stop_sequence: Int
    var stopNumber: String {
        stop_name.components(separatedBy: " #").last ?? "0"
    }
    
    var stopName: String {
        stop_name.components(separatedBy: " #").first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Stop"
    }
}
