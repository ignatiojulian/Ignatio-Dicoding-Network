//
//  Connectivity.swift
//  NewsApp
//
//  Created by Ignatio Julian on 11/09/21.
//

import Foundation
import Alamofire

public struct Connectivity {
    public init() {}
    public static let sharedInstance = NetworkReachabilityManager()!
    public static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}
 
