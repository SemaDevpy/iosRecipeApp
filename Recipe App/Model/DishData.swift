//
//  DishData.swift
//  Recipe App
//
//  Created by Syimyk on 10/11/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import Foundation


struct DishData : Codable {
    var meals : [Meals]
}


struct Meals : Codable {
    let strInstructions : String
}
