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
    func retrieveRecipeList() {
        // Alamofire request
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
}

protocol DataManagerDelegate: class{
    func retrieveSuccessfully(result: [RecipeModel])
}



