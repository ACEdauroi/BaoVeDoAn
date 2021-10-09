//
//  MainSearchViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 08/10/2021.
//

import UIKit

class MainSearchViewController: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
