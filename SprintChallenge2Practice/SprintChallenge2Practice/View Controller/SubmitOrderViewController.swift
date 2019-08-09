//
//  SubmitOrderViewController.swift
//  SprintChallenge2Practice
//
//  Created by Hayden Hastings on 8/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    // MARK: - Properties
    var shoppingItemController: ShoppingItemsController?

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message()
    }
    
    // MARK: - Methods
    func message() {
        if let numberOfItems = shoppingItemController?.selectedItems.count {
            messageLabel.text = "You currently have \(numberOfItems) item's in your shopping list."
        }
    }
    
    func submiteButton() {
        let alert = UIAlertController(title: "Submited", message: "Thanks \(nameTextField.text!)! The items you have added will be delived to your address at \(addressTextField.text!) in 15 Minutes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in let alert = UIAlertController(title: "Thank You", message: "You have successfully submitted your order.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in self.navigationController?.popViewController(animated: true)}))
            self.present(alert, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    @IBAction func submitButtonTapped(_ sender: Any) {
        submiteButton()
    }
}
