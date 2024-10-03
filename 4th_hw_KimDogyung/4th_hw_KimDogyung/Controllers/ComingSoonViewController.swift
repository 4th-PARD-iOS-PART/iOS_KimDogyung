//
//  ComingSoonViewController.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/25.
//

import UIKit

class ComingSoonViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16.91, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bell")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 7
            //stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.register(ComingTableViewCell.self, forCellReuseIdentifier: ComingTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        stackView.addArrangedSubview(notificationImageView)
        stackView.addArrangedSubview(titleLabel)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(stackView)
        setUI()
    }
    
    func setUI() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            
            notificationImageView.widthAnchor.constraint(equalToConstant: 19),
            notificationImageView.heightAnchor.constraint(equalToConstant: 19),
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
}


extension ComingSoonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ComingModel.modeling.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComingTableViewCell.identifier, for: indexPath) as? ComingTableViewCell else {return UITableViewCell()}
        
        // Get the corresponding SearchModel object
        let comingItem = ComingModel.modeling[indexPath.row]
                
        // Set the cell's image and title using the SearchModel data
        cell.configure(with: comingItem)
                
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}
