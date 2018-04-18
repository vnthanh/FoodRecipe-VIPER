//
//  RecipeDetailRouter.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailRouter: RecipeDetailRouterProtocol {
    static func createRecipeDetailModule(withRecipeId id: String) -> UIViewController {
        if let detailView: RecipeDetailView = mainStoryBoard.instantiateViewController(withIdentifier: "RecipeDetailController") as? RecipeDetailView {
            let presenter: RecipeDetailPresenterProtocol & RecipeDetailInteractorOutputProtocol = RecipeDetailPresenter()
            let interactor: RecipeDetailInteractorInputProtocol = RecipeDetailInteractor()
        
            detailView.presenter = presenter
            presenter.view = detailView
            presenter.interactor = interactor
            
            // Presenter get the recipe id here
            presenter.recipeId = id

            interactor.presenter = presenter
            
            return detailView
        }
        return UIViewController()
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
