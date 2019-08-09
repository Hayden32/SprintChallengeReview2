//
//  ShoppingListCollectionViewController.swift
//  SprintChallenge2Practice
//
//  Created by Hayden Hastings on 8/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingListCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let shoppingItemsController = ShoppingItemsController()

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShoppingDetail" {
            let detailVC = segue.destination as! SubmitOrderViewController
            detailVC.shoppingItemController = self.shoppingItemsController
        }
    }
 

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemsController.shoppingItem.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingListCollectionViewCell
    
        let shoppingList = shoppingItemsController.shoppingItem[indexPath.item]
        cell.shoppingItems = shoppingList
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoppingItemsController.update(item: shoppingItemsController.shoppingItem[indexPath.item])
        collectionView.reloadData()
    }
}
