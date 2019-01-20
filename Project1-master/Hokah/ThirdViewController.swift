//
//  ThirdViewController.swift
//  Hokah
//
//  Created by Кирилл Иванов on 06/01/2019.
//  Copyright © 2019 Kirill Ivanoff. All rights reserved.
//

import UIKit
import os.log

class ThirdViewController: UITableViewController, UINavigationControllerDelegate {

    var selectedTabacoo: String!
    var flavours = [Flavour]()
    var table: Int!
    let tanjTastes = ["Малина", "Крем-брюле", "яблоко", "Манго", "Апельсин"]
    let blablaTastes = ["Малина", "Крем-брюле", "яблоко", "Персик", "Манго"]
    let huyTastes = ["Малина", "Крем-брюле", "яблоко", "Персик","Апельсин"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleFlavours()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return flavours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Flavour", for: indexPath) as? FlavourTableViewCell else { fatalError() }
        
        let flavour = flavours[indexPath.row]
        
        cell.nameLabel.text = flavour.name
        cell.photoImage.image = flavour.photoImage
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToResult" {
            guard let resultController = segue.destination as? Result else {return}
            
            if let indexPath = tableView.indexPathForSelectedRow {
                resultController.selectedTable = table
                resultController.selectedTabacoo = selectedTabacoo
                resultController.selectedFlavour = flavours[indexPath.row].name
                
                print(table)
                print(selectedTabacoo)
                print(flavours[indexPath.row].name)
            }
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let result = storyboard?.instantiateViewController(withIdentifier: "Result") as? Result {
            
            guard let table = table else { return }
            
            result.selectedTable = table
            result.selectedTabacoo = selectedTabacoo
            result.selectedFlavour = flavours[indexPath.row].name
            
            navigationController?.pushViewController(result, animated: true)
        }
    }
    */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(144)
    }
    
    private func loadSampleFlavours() {
        guard let selectedTabacoo = selectedTabacoo else { return }
        
        switch selectedTabacoo {
        case "darkside":
            for i in 0..<tanjTastes.count {
                let photoImage = UIImage(named: "meal\(i+1)")
                let name = tanjTastes[i]
                
                guard let flavour = Flavour(name: name, photoImage: photoImage) else { fatalError() }
                flavours.append(flavour)
            }
        case "adalya":
            for i in 0..<blablaTastes.count {
                let photoImage = UIImage(named: "meal\(i+1)")
                let name = blablaTastes[i]
                
                guard let flavour = Flavour(name: name, photoImage: photoImage) else { fatalError() }
                flavours.append(flavour)
            }
        case "al faker":
            for i in 0..<huyTastes.count {
                let photoImage = UIImage(named: "meal\(i+1)")
                let name = huyTastes[i]
                
                guard let flavour = Flavour(name: name, photoImage: photoImage) else { fatalError() }
                flavours.append(flavour)
            }
        default:
            return
        }
    }
}
