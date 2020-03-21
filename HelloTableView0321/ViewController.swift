//
//  ViewController.swift
//  HelloTableView0321
//
//  Created by 申潤五 on 2020/3/21.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    var phoneBook:[[String:String]] = []
    @IBOutlet weak var theTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        theTableView.dataSource = self
        theTableView.delegate = self
        if let oldAddBook = UserDefaults.standard.value(forKey: "AddressBook") as? [[String:String]]{
            phoneBook = oldAddBook
            print(phoneBook)
        }
        
    }

    //MARK: TableView Data Source & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneBook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        cell.name.text = phoneBook[indexPath.row]["name"]
        cell.phone.text = phoneBook[indexPath.row]["phone"]
        return cell
    }
    
    
}

