//
//  RecipeDetailPresenter.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation

class RecipeDetailPresenter: RecipeDetailPresenterProtocol {
    weak var view: RecipeDetailViewProtocol?
    var interactor: RecipeDetailInteractorInputProtocol?
    
    var recipeId: String?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveRecipeDetail(withId: recipeId!)
    }
}

extension RecipeDetailPresenter: RecipeDetailInteractorOutputProtocol {
    func didRetrieveRecipeDetail(_ recipeDetail: RecipeDetailModel) {
        view?.hideLoading()
        view?.showDetail(with: recipeDetail)
    }
}
