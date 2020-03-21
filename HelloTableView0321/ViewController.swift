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

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        if let oldAddBook = UserDefaults.standard.value(forKey: "AddressBook") as? [[String:String]]{
            phoneBook = oldAddBook
            print(phoneBook)
        }
        theTableView.reloadData()
    }

    //MARK: TableView Data Source & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneBook.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 25))
        headerView.backgroundColor = UIColor.yellow
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(phoneBook[indexPath.row]["phone"]!)
        let telephoneNumber = phoneBook[indexPath.row]["phone"]!
        var str = "要打出去了:\(telephoneNumber)"
                let alertVC = UIAlertController(title: str, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "打電話", style: .default) { (action) in
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        cell.name.text = phoneBook[indexPath.row]["name"]
        cell.phone.text = phoneBook[indexPath.row]["phone"]
        return cell
    }
    
    
}

