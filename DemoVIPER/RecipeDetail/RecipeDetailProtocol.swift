//
//  RecipeDetailProtocol.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeDetailViewProtocol: class {
    var presenter: RecipeDetailPresenterProtocol? { get set }
    
    func showDetail(with recipeDetail: RecipeDetailModel)
    func showLoading()
    func hideLoading()
}

protocol RecipeDetailPresenterProtocol: class {
    var view: RecipeDetailViewProtocol? { get set }
    var interactor: RecipeDetailInteractorInputProtocol? { get set }
    
    // Presenter need the recipe id
    var recipeId: String? { get set }
    
    func viewDidLoad()
}

protocol RecipeDetailRouterProtocol: class {
    static func createRecipeDetailModule(withRecipeId id: String) -> UIViewController
}

// Interactor:
protocol RecipeDetailInteractorOutputProtocol: class {
    func didRetrieveRecipeDetail(_ recipeDetail: RecipeDetailModel)
}

protocol RecipeDetailInteractorInputProtocol: class {
    var presenter: RecipeDetailInteractorOutputProtocol? { get set }
    func retrieveRecipeDetail(withId recipeId: String)
}
