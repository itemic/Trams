//
//  TramRoutesViewModel.swift
//  TramRoutesViewModel
//
//  Created by Terran Kroft on 8/6/21.
//

import Foundation
import SwiftUI

public final class TramLineViewModel: ObservableObject {
    @Published var directions: [Direction] = []
    @Published var stops: [Stop] = []
    
    
    init(client: NetworkManager) {
    }
    
    func load(id: Int) async throws {
        print("abc")
        let url = URL(string: NetworkManager().authenticateForDirection(id: id))!
        let (data, response) = try await URLSession.shared.data(from: url)
        print(String(data: data, encoding: String.Encoding.utf8)! as String)
        let decoder = JSONDecoder()
        do {
        let r = try decoder.decode(Directions.self, from: data)
            directions = r.directions
        } catch {
                fatalError("failed to decode")
        }
        
    }
    
    func updateStops(id: Int, direction: Int) async throws {
        print("abc")
        let url = URL(string: NetworkManager().authenticateForStops(id: id, direction: direction))!
        let (data, response) = try await URLSession.shared.data(from: url)
        print(String(data: data, encoding: String.Encoding.utf8)! as String)
        let decoder = JSONDecoder()
        do {
        let r = try decoder.decode(Stops.self, from: data)
            stops = r.stops
        } catch {
                fatalError("failed to decode")
        }
    }
}
