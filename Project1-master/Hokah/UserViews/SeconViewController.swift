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
    var selectedTable : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Choose tabacoo"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tobaccos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TabacoCell", for: indexPath)
        cell.textLabel?.text = tobaccos[indexPath.row].name
        
        if !tobaccos[indexPath.row].isAvailable {
            print("ne ok")
            cell.textLabel?.isEnabled = false
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let cell = tableView.cellForRow(at: indexPath) else {return nil}
        if cell.selectionStyle == .none {
            return nil
        }
        return indexPath
    }
    
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
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(144)
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFlavour" {
            guard let flavourController = segue.destination as? ThirdViewController else {return}
            flavourController.table = selectedTable
            if let indexPath = tableView.indexPathForSelectedRow {
                flavourController.selectedTabacoo = tobaccos[indexPath.row].name
                print(selectedTable)
                print(tobaccos[indexPath.row].name)
            }
        }
    }
}
