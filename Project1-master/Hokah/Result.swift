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
    var selectedFlavour: [String]?
    var flavours: String = ""
    
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var tabacoo: UILabel!
    @IBOutlet weak var flavour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let selectedTable = selectedTable else { return }
        guard let selectedTabacoo = selectedTabacoo else { return }
        guard let selectedFlavour = selectedFlavour else { return }
        if selectedFlavour == [] {
            print("EMPTY")
        } else {
            print("ya tut")
            print(selectedFlavour)
        }
        
        tableNumber.text = "Table \(selectedTable+1)"
        for i in 0..<selectedFlavour.count {
            if i == selectedFlavour.count - 1 {
                flavours += selectedFlavour[i]
            } else {
                flavours += selectedFlavour[i] + ", "
            }
        }
        tabacoo.text = selectedTabacoo
        flavour.text = flavours
    }
    
    
    
}
