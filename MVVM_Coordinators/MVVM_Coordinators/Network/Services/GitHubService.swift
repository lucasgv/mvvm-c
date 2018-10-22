//
//  GitHubService.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 22/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import Foundation
import UIKit
import Moya

public enum GitHubService {
    static private let clientId = "YOUR CLIENT ID"
    
    case repositories
}

extension GitHubService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.github.com/")!
    }
    
    public var path: String {
        switch self {
        case .repositories: return "users/lucasgv/repos"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .repositories: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        
        switch self {
        case .repositories:
            return .requestParameters(parameters: ["type": "all",
                                                   "sort": "created",
                                                   "direction": "asc"],
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
