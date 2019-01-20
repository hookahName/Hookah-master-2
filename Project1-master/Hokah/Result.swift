//
//  Result.swift
//  Hokah
//
//  Created by Кирилл Иванов on 06/01/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class Result: UIViewController, UINavigationControllerDelegate {

    var selectedTable: Int!
    var selectedTabacoo: String!
    var selectedFlavour: String!
    
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var tabacoo: UILabel!
    @IBOutlet weak var flavour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let table = selectedTable {
            tableNumber.text = "Table \(table + 1)"
        }
        if let tabaco = selectedTabacoo {
            tabacoo.text = tabaco
        }
        if let flavourSelect = selectedFlavour {
            flavour.text = flavourSelect
        }
    }
}
