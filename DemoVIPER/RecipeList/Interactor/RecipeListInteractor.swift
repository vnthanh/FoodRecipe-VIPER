//
//  RecipeListInteractor.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation

class RecipeListInteractor: RecipeListInteractorInputProtocol {
    weak var presenter: RecipeListInteractorOutputProtocol?
    
    func retrieveRecipeLists() {
        let dataManager = DataManager()
        dataManager.dataManagerDelegate = self
        dataManager.retrieveRecipeList()
    }
}

extension RecipeListInteractor: DataManagerDelegate {
    func retrieveSuccessfully(result: [RecipeModel]) {
        presenter?.didRetrieveRecipes(result)
    }
}
