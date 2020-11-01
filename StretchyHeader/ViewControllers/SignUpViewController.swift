//
//  SignUpViewController.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, TableViewStretchable {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            signUpButton.layer.cornerRadius = 5
        }
    }
    
    lazy var headerView: HeaderViewStretchable = {
        let headerView: SignUpHeaderView = instanceFromNib()
        return headerView
    }()
    
    let items: [SignUpItem] = [.firstName, .lastName, .address,
            .email, .mobileNo, .password, .confirmPassword]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar
        .setBarColor(.clear)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInsetAdjustmentBehavior = .never
        activateHeaderStretchability()
    }
    
}

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateStretchableHeader()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SignUpTableViewCell = tableView.dequeueReusableCell(withIdentifier:
            SignUpTableViewCell.identifier) as! SignUpTableViewCell
        
        cell.bind(items[indexPath.row])
        
        return cell
    }
    
}