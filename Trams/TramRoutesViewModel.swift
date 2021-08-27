//
//  TramRoutesViewModel.swift
//  TramRoutesViewModel
//
//  Created by Terran Kroft on 8/6/21.
//

import Foundation
import SwiftUI

public final class TramRoutesViewModel: ObservableObject {
    @Published var routes: [Route] = []
    
    
    init(client: NetworkManager) {
        
    }
    
    func load() async throws {
        print("abc")
        let url = URL(string: NetworkManager().authenticate())!
        let (data, response) = try await URLSession.shared.data(from: url)
        print(String(data: data, encoding: String.Encoding.utf8)! as String)
        let decoder = JSONDecoder()
        do {
        let r = try decoder.decode(Routes.self, from: data)
            routes = r.routes
        } catch {
                fatalError("failed to decode")
        }
        
    }
}
