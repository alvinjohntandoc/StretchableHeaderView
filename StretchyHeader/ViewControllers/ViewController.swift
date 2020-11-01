//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let easternBlue: UIColor = UIColor(named: "easternBlue")!
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.cornerRadius = 5
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?
            .navigationBar.setBarColor(easternBlue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stretchy Header"
    }

    @IBAction func registerAction(_ sender: Any) {
        performSegue(withIdentifier: "SignUpTableViewController", sender: nil)
    }
    
}

