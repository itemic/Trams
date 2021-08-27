//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Terran Kroft on 8/6/21.
//

import Foundation
import CryptoKit

public final class NetworkManager {
    
    //set these values separately
    private let appID  = APPLICATION_ID
    private let appKey = APPLICATION_KEY

    let baseURL = "http://timetableapi.ptv.vic.gov.au"
    
    func authenticate(uri: String = "/v3/routes?route_types=1") -> String {
        // TODO: if there are already parameters then this is gonna be different but just testing for now
        let uriWithId = uri + "&devid=" + appID
        let signature = uriWithId.hmac(key: appKey)
        let result = baseURL + uriWithId + "&signature=" + signature
        print(result)
        return result
    }
    
    func authenticateForDirection(uri: String = "/v3/directions/route/", id: Int) -> String {
        let uriWithId = uri + "\(id)?devid=" + appID
        let signature = uriWithId.hmac(key: appKey)
        let result = baseURL + uriWithId + "&signature=" + signature
        print(result)
        return result
    }
    
    func authenticateForStops(id: Int, direction: Int) -> String {
        let uriWithId = "/v3/stops/route/\(id)/route_type/1?direction_id=\(direction)&devid=" + appID
        let signature = uriWithId.hmac(key: appKey)
        let result = baseURL + uriWithId + "&signature=" + signature
        print(result)
        return result
    }
    
 
}

extension String {
    func hmac(key: String) -> String {
        let secret = key.data(using: .utf8)!
        let message = self.data(using: .utf8)!
        let hmac = HMAC<Insecure.SHA1>.authenticationCode(for: message, using: SymmetricKey(data: secret))
        let result = Data(hmac).map { String(format: "%02hhx", $0)}.joined().uppercased()
        print(result)
        return result
    }
}
