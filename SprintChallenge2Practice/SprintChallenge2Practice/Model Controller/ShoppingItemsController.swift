//
//  ShoppingItemsController.swift
//  SprintChallenge2Practice
//
//  Created by Hayden Hastings on 8/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ShoppingItemsController {
    
    // MARK: - Properties
    
    private var persistantURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        print("Documents: \(documents.path)")
        return documents.appendingPathComponent("shoppinglist.plist")
    }
    
    private(set) var initCheck: Bool?
    var shoppingItem: [ShoppingItems] = []
    let forKey = "ShoppingItems"
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var selectedItems: [ShoppingItems] {
        return shoppingItem.filter { $0.hasBeenAdded == true }
    }
    
    // MARK: - init()
    
    init() {
        initCheck = UserDefaults.standard.bool(forKey: forKey)
        for item in itemNames {
            if let image = UIImage(named: item) {
                let shoppingList = ShoppingItems(itemName: item, name: item, hasBeenAdded: false)
                shoppingItem.append(shoppingList)
            }
        }
        UserDefaults.standard.set(true, forKey: forKey)
    }
    
    // MARK: - Update Function
    
    func update(item: ShoppingItems) {
        guard let index = shoppingItem.firstIndex(of: item) else { return }
        shoppingItem[index].hasBeenAdded = !shoppingItem[index].hasBeenAdded
        saveToPersistantStore()
    }
    
    // MARK: - Save and Load from persistant store
    
    func saveToPersistantStore() {
        guard let url = persistantURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItem)
            try data.write(to: url)
        } catch {
            print("Error saving to persistant store. \(error)")
        }
    }
    
    func loadFromPersistantStore() {
        // make sure file exists
        let fileManager = FileManager.default
        guard let url = persistantURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItem = try decoder.decode([ShoppingItems].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
}
