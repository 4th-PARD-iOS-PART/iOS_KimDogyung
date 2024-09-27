//
//  SearchViewController.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/25.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    func setUI() {
        let label1: UILabel = {
            let label = UILabel();
            label.translatesAutoresizingMaskIntoConstraints = false;
            label.text = "Search";
            label.textColor = .white
            return label;
        }()
        
        view.addSubview(label1);
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
}
