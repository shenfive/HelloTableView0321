//
//  InputViewController.swift
//  HelloTableView0321
//
//  Created by 申潤五 on 2020/3/21.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var phoneBook:[[String:String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let oldAddBook = UserDefaults.standard.value(forKey: "AddressBook") as? [[String:String]]{
            phoneBook = oldAddBook
            print(phoneBook)
        }
    }
    

    @IBAction func add(_ sender: Any) {
        
        guard let name = nameTF.text else{ return }
        guard let phone = phoneTF.text else { return }
        
        if name.count < 3{
            let alertVC = UIAlertController(title: "Error", message: "名稱最少三碼", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "我知道了", style: .cancel, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
        
        if phone.count < 8 {
            let alertVC = UIAlertController(title: "Error", message: "電話最少八碼", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "我知道了", style: .cancel, handler: nil)
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
            return
        }
        
        let phoneItem = ["name":name,"phone":phone]
        phoneBook.append(phoneItem)
        
        UserDefaults.standard.set(phoneBook, forKey: "AddressBook")
        UserDefaults.standard.synchronize()
        
        let alertVC = UIAlertController(title: "己成功新増", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "我知道了", style: .default) { (action) in
            self.nameTF.text = nil
            self.phoneTF.text = nil
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
        
        
        
        return
        
        
    }
    

}
