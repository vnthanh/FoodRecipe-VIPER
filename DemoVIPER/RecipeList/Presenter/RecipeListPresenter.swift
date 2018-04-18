//
//  RecipeListPresenter.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation

class RecipeListPresenter: RecipeListPresenterProtocol {
    weak var view: RecipeListViewProtocol?
    var interactor: RecipeListInteractorInputProtocol?
    var router: RecipeListRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveRecipeLists()
    }
    
    func showRecipeDetail(for recipe: RecipeModel) {
        router?.presentRecipeDetailScreen(from: view!, for: recipe)
    }
}

extension RecipeListPresenter: RecipeListInteractorOutputProtocol {
    func didRetrieveRecipes(_ recipes: [RecipeModel]) {
        view?.hideLoading()
        view?.showRecipes(with: recipes)
    }
}
