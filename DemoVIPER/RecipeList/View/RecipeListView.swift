//
//  RecipeListView.swift
//  DemoVIPER
//
//  Created by ThanhVo on 4/17/18.
//  Copyright © 2018 ThanhVo. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
import AlamofireImage

class RecipeListView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: RecipeListPresenterProtocol?
    var recipeList: [RecipeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension RecipeListView: RecipeListViewProtocol {
    func showRecipes(with recipes: [RecipeModel]) {
        self.recipeList = recipes
        tableView.reloadData()
    }
    
    func showLoading() {
        // Show a loading view
        HUD.show(.progress)
    }
    
    func hideLoading() {
        // Hide the loading view
        HUD.hide()
    }
}

extension RecipeListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let recipe = recipeList[indexPath.row]
        cell.textLabel?.text = recipe.title
        cell.imageView?.af_setImage(withURL: URL(string: recipe.image_url)!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showRecipeDetail(for: recipeList[indexPath.row])
    }
}
