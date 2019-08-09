//
//  ShoppingListCollectionViewCell.swift
//  SprintChallenge2Practice
//
//  Created by Hayden Hastings on 8/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    // MARK: - Properties
    var shoppingItems: ShoppingItems? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    
    func updateViews() {
        guard let shoppingItem = shoppingItems else { return }
        
        itemNameLabel.text = shoppingItem.name
        itemImageView.image = UIImage(named: shoppingItem.itemName)
        if shoppingItem.hasBeenAdded == false {
            hasBeenAddedLabel.text = "Not Added"
        } else if shoppingItem.hasBeenAdded == true {
            hasBeenAddedLabel.text = "Added"
        }
    }
}
