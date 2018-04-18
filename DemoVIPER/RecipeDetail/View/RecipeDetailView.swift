//
//  RecipeDetailView.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

class RecipeDetailView: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var presenter: RecipeDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension RecipeDetailView: RecipeDetailViewProtocol {
    func showDetail(with recipeDetail: RecipeDetailModel) {
        titleLabel.text = recipeDetail.title
        var ingredientsText = ""
        for ingredient in recipeDetail.ingredients {
            ingredientsText = ingredientsText + ingredient + "\n"
        }
        textView.text = ingredientsText
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
}

