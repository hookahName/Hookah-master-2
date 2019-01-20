//
//  AdminTableViewController.swift
//  Hokah
//
//  Created by Кирилл Иванов on 20/01/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit
import Firebase

class AdminTableViewController: UITableViewController {

    var ref: DatabaseReference!
    var tobaccos: Array<TobaccoDB>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Available"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tobaccos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell", for: indexPath)
        cell.textLabel?.text = tobaccos[indexPath.row].name
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(tobaccos[indexPath.row].isAvailable, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        cell.selectionStyle = .gray
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ref = Database.database().reference().child("tobaccos")
            let tabaco = tobaccos[indexPath.row]
            tabaco.ref?.removeValue()
            //tobaccos.remove(at: indexPath.row)
           // tableView.reloadData()
        }
    }
    
    @objc func switchChanged(_ sender: UISwitch!) {
        tobaccos[sender.tag].isAvailable = !tobaccos[sender.tag].isAvailable
        updateDatabase()
    }
    
    func updateDatabase() {
        ref = Database.database().reference()
        for tobacoo in tobaccos {
            ref.child("tobaccos").child(tobacoo.name).setValue(["name": tobacoo.name, "isAvailable": tobacoo.isAvailable])
        }
    }
    
    @IBAction func add(_ sender: Any) {
        ref = Database.database().reference()
        let alertController = UIAlertController(title: "New tabacoo", message: "Add new tabacoo", preferredStyle: .alert)
        alertController.addTextField()
        let save = UIAlertAction(title: "Save", style: .default) { [ weak self] _ in
            
            guard let textField = alertController.textFields?.first, textField.text != "" else {return}
            let tabaco = TobaccoDB(name: textField.text!)
            let tabacoRef = self?.ref.child("tobaccos").child(tabaco!.name.lowercased())
            tabacoRef?.setValue(tabaco?.convertToDictionary())
            //self?.tobaccos.append(tabaco!)
            self?.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}
