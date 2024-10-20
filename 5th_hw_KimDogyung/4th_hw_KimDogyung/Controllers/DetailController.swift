//
//  DetailController.swift
//  4th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/19.
//

import UIKit

class DetailController: UIViewController, HeaderViewDelegate {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = true
//        sizeHeaderToFit()
        setUI()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        sizeHeaderToFit()
//    }
    
    // Dynamically size the header to fit its content
//    func sizeHeaderToFit() {
//        guard let headerView = tableView.tableHeaderView else { return }
//        
//        headerView.setNeedsLayout()
//        headerView.layoutIfNeeded()
//        
//        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        var frame = headerView.frame
//        frame.size.height = headerSize.height
//        headerView.frame = frame
//        
//        tableView.tableHeaderView = headerView
//    }

    
    func setUI(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        // Set up the header view
        let headerView = DetailHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 760))
                
//        // Ensure the layout is up to date
//        headerView.setNeedsLayout()
//        headerView.layoutIfNeeded()
//                
//        // Calculate the required size for the header
//        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//                
//        // Set the calculated height
//        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: headerSize.height)
        headerView.delegate = self
        tableView.tableHeaderView = headerView

        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
        
    }
    
    @objc func didTapBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
}


extension DetailController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else {return UITableViewCell()}
        
        
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    
}
