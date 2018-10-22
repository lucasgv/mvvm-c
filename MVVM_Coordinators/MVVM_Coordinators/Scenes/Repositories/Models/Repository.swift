//
//  Repository.swift
//  MVVM_Coordinators
//
//  Created by Lucas Valle on 22/10/2018.
//  Copyright © 2018 Lucas Valle. All rights reserved.
//

import Foundation
import Mapper

struct Repository: Mappable {
    
    public let name: String
    
    init(map: Mapper) throws {
        try name = map.from("full_name")
    }
}
