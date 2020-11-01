//
//  StretchyViewController.swift
//  StretchyHeader
//
//  Created by Alvin John Tandoc on 11/1/20.
//  Copyright © 2020 Alvin John Tandoc. All rights reserved.
//

import UIKit

class StretchyViewController: UIViewController {
    
    /// A uiview that conforms to HeaderViewStretchable,
    ///  this will be the header view of our scrollView
    private var __headerView: HeaderViewStretchable? {
        didSet {
            activateHeaderStretchability()
        }
    }
    
    private var scrollView: UIScrollView?
    
    private var willAppearNavigationbarColor: UIColor = UIColor.clear
    
    private var defaultNavigationColor: UIColor {
        self.navigationController?
            .navigationBar.tintColor ?? UIColor.clear
    }
    
    private lazy var willDismissNavigationbarColor: UIColor = {
        return defaultNavigationColor
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar
            .setBarColor(willAppearNavigationbarColor)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar
            .setBarColor(willDismissNavigationbarColor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func activateHeaderStretchability() {
        guard let headerView = __headerView else { return }
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.bringSubviewToFront(headerView)
        
        headerView.stickyHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: headerView.defaultHeight)
        
        NSLayoutConstraint.activate([
            headerView.stickyHeightConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        scrollView?.contentInset = UIEdgeInsets(top: headerView.defaultHeight, left: 0, bottom: 0, right: 0)
    }
    
    private func updateStretchableHeader() {
        guard let headerView = __headerView,
            let __scrollView = scrollView else { return }
        
        let offset = __scrollView.contentOffset.y + headerView.defaultHeight
        
        let computedHeightBasedOnOffset: CGFloat = (headerView.defaultHeight + (-offset))
        let finalHeight = computedHeightBasedOnOffset >= headerView.minimumHeight
            ? computedHeightBasedOnOffset : headerView.minimumHeight
        
        headerView.stickyHeightConstraint?.constant = finalHeight
    }
    
    func setHeaderView(_ headerView: HeaderViewStretchable, in scrollView: UIScrollView) {
        self.scrollView = scrollView
        scrollView.delegate = self
        __headerView = headerView
    }
    
    func setNavigationBarColor(willAppear: UIColor, willDismiss: UIColor) {
        willAppearNavigationbarColor = willAppear
        willDismissNavigationbarColor = willDismiss
    }
}

extension StretchyViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateStretchableHeader()
    }
    
}

