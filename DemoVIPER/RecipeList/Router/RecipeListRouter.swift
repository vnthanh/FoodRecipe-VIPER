//
//  RecipeListRouter.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import UIKit

class RecipeListRouter: RecipeListRouterProtocol {
    static func createRecipeListModule() -> UIViewController {
        let navigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RecipesNavigationController")
        if let view = navigationController.childViewControllers.first as? RecipeListView {
            let presenter: RecipeListPresenterProtocol & RecipeListInteractorOutputProtocol = RecipeListPresenter()
            let interactor: RecipeListInteractorInputProtocol = RecipeListInteractor()
            let router: RecipeListRouterProtocol = RecipeListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navigationController
        }
        return UIViewController()
    }
    
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentRecipeDetailScreen(from view: RecipeListViewProtocol, for recipe: RecipeModel) {
        // Create the recipe detail module -> detail view controller
        let detailViewController = RecipeDetailRouter.createRecipeDetailModule(withRecipeId: recipe.id)
        // Push the detail view controller
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
