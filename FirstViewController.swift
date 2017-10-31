//
//  FirstViewController.swift
//  To Do List
//
//  Created by Aimable Niyogakiza on 08/10/2017.
//  Copyright © 2017 Aima. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var items:[String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        func refreshUI() {
            DispatchQueue.main.async{
                tableView.reloadData() }
            
        }
         return items.count
        
    }
    
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        
        cell.textLabel?.text = (items[indexPath.row] )
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            
            itemsObject = tempItems
            
        }
        table.reloadData()
        
    }
    
   

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            
        }

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   }

}
