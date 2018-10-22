//
//  CodableResponses.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 22/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import Foundation

struct RepositoryResponse<T: Codable>: Codable {
    let data: RepositoryResults<T>
}

struct RepositoryResults<T: Codable>: Codable {
    let results: [T]
}

