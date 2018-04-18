//
//  RecipeModel.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import ObjectMapper

// The recipe basic info
struct RecipeModel {
    var id = ""
    var title = ""
    var image_url = ""
}

extension RecipeModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["recipe_id"]
        title <- map["title"]
        image_url <- map["image_url"]
    }
}

// Response object from server
struct RecipesResponseObject {
    var count: Int = 0
    var recipes: [RecipeModel] = []
}

extension RecipesResponseObject: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        count <- map["count"]
        recipes <- map["recipes"]
    }
}
