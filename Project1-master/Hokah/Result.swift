//
//  Result.swift
//  Hokah
//
//  Created by Кирилл Иванов on 06/01/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit

class Result: UIViewController, UINavigationControllerDelegate {

    var selectedTable: Int?
    var selectedTabacoo: String?
    var selectedFlavour: String?
    
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var tabacoo: UILabel!
    @IBOutlet weak var flavour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let selectedTable = selectedTable else { return }
        guard let selectedTabacoo = selectedTabacoo else { return }
        guard let selectedFlavour = selectedFlavour else { return }
        
        tableNumber.text = "Table \(selectedTable)"
        tabacoo.text = selectedTabacoo
        flavour.text = selectedFlavour
    }
    
    
    
}
