//
//  DataManager.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class DataManager {
    var dataManagerDelegate: DataManagerDelegate?
    var dataManagerDetailDelegate: DataManagerDetailDelegate?
    
    // Get recipe list
    func retrieveRecipeList() {
        let url = "http://food2fork.com/api/search?key=7094f866ecc388982e34015eddfaa2d8"
        
        Alamofire.request(url, method: .get).validate().responseObject(completionHandler: { (response : DataResponse<RecipesResponseObject>)  in
            switch response.result {
            case .success(_):
                self.dataManagerDelegate?.retrieveSuccessfully(result: (response.result.value?.recipes)!)
            case .failure(_):
                print("Something went wrong")
            }
        })
    }
    
    // Get recipe detail
    func retrieveRecipeDetail(with recipeId: String) {
        let url = "http://food2fork.com/api/get/?key=7094f866ecc388982e34015eddfaa2d8&rId=\(recipeId)"
        
        Alamofire.request(url, method: .get).validate().responseObject(completionHandler: { (response : DataResponse<DetailResponseObject>)  in
            switch response.result {
            case .success(_):
                self.dataManagerDetailDelegate?.retrieveDetailSuccessfully(result: (response.result.value?.recipe)!)
            case .failure(_):
                print("Something went wrong")
            }
        })
    }
}

protocol DataManagerDelegate: class{
    func retrieveSuccessfully(result: [RecipeModel])
}

protocol DataManagerDetailDelegate: class{
    func retrieveDetailSuccessfully(result: RecipeDetailModel)
}



