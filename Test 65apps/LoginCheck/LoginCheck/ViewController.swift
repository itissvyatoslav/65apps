//
//  ViewController.swift
//  LoginCheck
//
//  Created by Svyatoslav Vladimirovich on 17.10.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit
import Foundation

class CheckLoginViewController: UIViewController {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginTF: UITextField!
    
    @IBAction func checkAction(_ sender: Any) {
        checkLogin(login: loginTF.text ?? "")
    }
    
    private let firstLetterBan: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
    
    private let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz0123456789.-")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func checkLogin(login: String) -> Bool {
        var isBan = false
        if login.count < 3 || login.count > 32 {
            label.text = "not suitable length"
            isBan = true
        }
        if firstLetterBan.contains(login[0]) {
            label.text = "not available first letter"
            isBan = true
        }
        if login.lowercased().rangeOfCharacter(from: characterset.inverted) != nil {
            label.text = "login contains invalid characters"
            isBan = true
        }
        if !isBan {
            label.text = "Good Login!"
        }
        return isBan
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Car {
    
}

