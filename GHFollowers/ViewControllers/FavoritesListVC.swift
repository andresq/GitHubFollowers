//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Andres Quintero on 8/22/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    let tableview = UITableView()
    var favorites: [Follower] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.frame = view.bounds // as big as you can
        tableview.rowHeight = 80
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.reuseID)
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No Favorites Yet!", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                        self.view.bringSubviewToFront(self.tableview)
                    }
                }
            case .failure(let error):
                self.presentGFAlerOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: FavoritesCell.reuseID) as! FavoritesCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destinationVC = FollowerListVC()
        destinationVC.username = favorite.login
        destinationVC.title = favorite.login
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] (error) in
            guard let self = self else { return }
            
            guard let error = error else { return }
            self.presentGFAlerOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
    
    
}
