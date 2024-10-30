//
//  MoreViewController.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/29.
//

import UIKit

class MoreViewController:UIViewController {
    
    var partLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let pardLabel: UILabel = {
        let label = UILabel()
        label.text = "PARD"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editButton:UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Edit" // Correct way to set title with configuration
        config.buttonSize = .medium
        let button = UIButton(configuration: config)
        //button.addTarget(self, action: #selector(openFormModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let deleteButton:UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Delete" // Correct way to set title with configuration
        config.buttonSize = .medium
        config.baseForegroundColor = .red
        let button = UIButton(configuration: config)
        //button.addTarget(self, action: #selector(openFormModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(pardLabel)
        view.addSubview(partLabel)
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(deleteButton)
        view.addSubview(editButton);
    
        
        NSLayoutConstraint.activate([
            
            deleteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            pardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pardLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            partLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            partLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            
        ])
        
        
    }
    
    
}
