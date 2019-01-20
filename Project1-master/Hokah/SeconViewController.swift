//
//  SeconViewController.swift
//  Hokah
//
//  Created by Кирилл Иванов on 06/01/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit
import Firebase
class SeconViewController: UITableViewController, UINavigationControllerDelegate {
    var ref: DatabaseReference!
    
    var tobaccos = Array<TobaccoDB>()
    var selectedTable : Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Choose tabacoo"
    }
    
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tobaccos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TabacoCell", for: indexPath)
        cell.textLabel?.text = tobaccos[indexPath.row].name
        if tobaccos[indexPath.row].isAvailable {
            print("ok")
        } else {
            print("ne ok")
        }
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 2 {
            
            return nil
        }
        return indexPath
    }
    */
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        var messageText: String
        
        switch indexPath.row {
        case 0:
            messageText = "darkside"
        case 1:
            messageText = "adalya"
        case 2:
            messageText = "al faker"
        default:
            return
        }
        let ac = UIAlertController(title: "Info", message: messageText, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(144)
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let tabacooo = storyboard?.instantiateViewController(withIdentifier: "Flavour") as? ThirdViewController {
            tabacooo.selectedTabacoo = tabacoos[indexPath.row].name
            
            guard let selectedTable = selectedTable else { return }
            tabacooo.table = selectedTable
            
            navigationController?.pushViewController(tabacooo, animated: true)
            
        }
    }
    */
}
