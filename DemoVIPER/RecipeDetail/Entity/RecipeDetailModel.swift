//
//  RecipeDetailModel.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import ObjectMapper

struct RecipeDetailModel {
    var title: String = ""
    var ingredients: [String] = []
}

extension RecipeDetailModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        ingredients <- map["ingredients"]
    }
}


// Response object from server
struct DetailResponseObject {
    var recipe: RecipeDetailModel = RecipeDetailModel()
}

extension DetailResponseObject: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        recipe <- map["recipe"]
    }
}
