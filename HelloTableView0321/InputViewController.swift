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
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func add(_ sender: Any) {
        print(nameTF.text)
        print(phoneTF.text)
        
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
        
    }
    

}
