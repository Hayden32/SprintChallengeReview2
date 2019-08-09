//
//  SubmitOrderViewController.swift
//  SprintChallenge2Practice
//
//  Created by Hayden Hastings on 8/9/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // MARK: - Properties
    var shoppingItemController: ShoppingItemsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
