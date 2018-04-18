//
//  RecipeListProtocol.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeListViewProtocol: class {
    var senter: RecipeListPresenterProtocol? { get set }
    
    func showRecipes(with recipes: [RecipeModel])
    func showLoading()
    func hideLoading()
}

protocol RecipeListPresenterProtocol: class {
    var view: RecipeListViewProtocol? { get set }
    var interactor: RecipeListInteractorInputProtocol? { get set }
    var router: RecipeListRouterProtocol? { get set }
    
    func viewDidLoad()
    func showRecipeDetail(for recipe: RecipeModel)
}


protocol RecipeListRouterProtocol: class {
    static func createRecipeListModule() -> UIViewController
    func presentRecipeDetailScreen(from view: RecipeListViewProtocol, for recipe: RecipeModel)
}


// Interactor
protocol RecipeListInteractorOutputProtocol: class {
    func didRetrieveRecipes(_ recipes: [RecipeModel])
}

protocol RecipeListInteractorInputProtocol: class {
    var presenter: RecipeListInteractorOutputProtocol? { get set }
    func retrieveRecipeLists()
}
