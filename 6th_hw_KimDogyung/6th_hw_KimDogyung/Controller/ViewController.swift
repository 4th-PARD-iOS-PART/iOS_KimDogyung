//
//  ViewController.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/28.
//

import UIKit

class ViewController: UIViewController {
    
    var memberData: [Member] = [];
    var selectedIndex: Int?
    
    let tableView: UITableView = {
        let tableView = UITableView();
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView;
    }()
    
    let headerView:UIView = {
        let header = UIView()
        header.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        return header
    }()
    
    let addButton:UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Add" // Correct way to set title with configuration
        config.buttonSize = .medium
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(openFormModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "UrlSession";
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func setUI(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        headerView.addSubview(headerTitleLabel)
        headerView.addSubview(addButton)
        tableView.tableHeaderView = headerView
        
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            headerTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            
            addButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            //addButton.leadingAnchor.constraint(equalTo: headerTitleLabel.trailingAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    @objc func openFormModal(){
        let modal = FormViewController()
        let navController = UINavigationController(rootViewController: modal)
        
        // Set the onDataAdded closure to call getRequest after adding new data
        modal.onDataAdded = { [weak self] in
            self?.fetchData() // Call function to reload data
        }
        
        self.present(navController, animated: true,completion: nil)
    }
    
    func fetchData() {
        let apiService = APIService()
        
        guard let url = apiService.makeURL(endpoint: .user, queryParams: ["part": "iOS"]) else {
            print("Failed to construct URL")
            return
        }
        
        NetworkManager.shared.getRequest(url: url) { [weak self] (result: Result<[Member], Error>) in
            switch result {
            case .success(let members):
                self?.memberData = members
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData()
        
        setUI()
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let item = memberData[indexPath.row]
                
        // Set the cell's image and title using the SearchModel data
        cell.configure(with: item)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        let modal = MoreViewController()
        modal.nameLabel.text = "Name: " + memberData[indexPath.row].name
        modal.partLabel.text = "Part: " + memberData[indexPath.row].part
        modal.ageLabel.text = "Age: " + String(memberData[indexPath.row].age)
        let navController = UINavigationController(rootViewController: modal)
        self.present(navController, animated: true,completion: nil)
    }
    
}
