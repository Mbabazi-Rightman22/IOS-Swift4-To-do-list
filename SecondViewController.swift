//
//  SecondViewController.swift
//  To Do List
//
//  Created by Aimable Niyogakiza on 08/10/2017.
//  Copyright © 2017 Aima. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var itemTextField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        let  itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            items.append(itemTextField.text!)
            print(items)
        }else {
             items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
