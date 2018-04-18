//
//  RecipeDetailInteractor.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation

class RecipeDetailInteractor: RecipeDetailInteractorInputProtocol {
    weak var presenter: RecipeDetailInteractorOutputProtocol?
    
    func retrieveRecipeDetail(withId recipeId: String) {
        // Call web API through a data manager
        let dataManager = DataManager()
        dataManager.dataManagerDetailDelegate = self
        dataManager.retrieveRecipeDetail(with: recipeId)
    }
}


extension RecipeDetailInteractor: DataManagerDetailDelegate {
    func retrieveDetailSuccessfully(result: RecipeDetailModel) {
        presenter?.didRetrieveRecipeDetail(result)
    }
}

