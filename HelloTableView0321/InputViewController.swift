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
    }
    

}
