//
//  HomeViewController.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Popular on Netflix", "Trending Now", "Top 10 in Nigeria Today", "My List", "African Movies", "Nollywood Movies & TV"]
    
    let tableViewUI: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(tableViewUI)
        
        tableViewUI.delegate = self
        tableViewUI.dataSource = self
        
        setupNavigationBar()
        
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
        tableViewUI.tableHeaderView = headerView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
            setupNavigationBar()
        
            // Set the tab bar appearance to black
            tabBarController?.tabBar.barTintColor = .black // Set tab bar background color
            tabBarController?.tabBar.tintColor = .white // Set selected item color
        }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Reset the navigation bar to be opaque before navigating to another view controller (like SearchViewController)
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default) // Reset background image
            navigationController?.navigationBar.shadowImage = nil // Reset shadow
            navigationController?.navigationBar.isTranslucent = false // Make it opaque
            navigationController?.navigationBar.backgroundColor = .black // Set default color
        }
    
    func setupNavigationBar() {
            // Make the navigation bar transparent
            if let navigationBar = navigationController?.navigationBar {
                // Set the background color to clear
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.shadowImage = UIImage() // Remove the shadow line under the navigation bar
                navigationBar.isTranslucent = true // Make it translucent
                navigationBar.backgroundColor = .clear // Set background color to clear
            }

            // Set title text attributes if needed
            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white, // Change title text color
                .font: UIFont.systemFont(ofSize: 18, weight: .bold) // Change title text font and size
            ]
            
            // Example of setting up left bar items (logo and text buttons)
        configureNavbar()
    }
    
    func configureNavbar(){
        var image = UIImage(named: "logo")
        image = image?.withRenderingMode(.alwaysOriginal)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        let logoImageView = UIImageView(image: image)
        //logoImageView.contentMode = .scaleAspectFit
        //logoImageView.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>)
        
        let button1 = UIButton(type: .system)
        button1.setTitle("TV Shows", for: .normal)
        //button1.addTarget(self, action: nil, for: <#T##UIControl.Event#>)
        button1.setTitleColor(.white, for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 17.2)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Movies", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 17.2)
        
        let button3 = UIButton(type: .system)
        button3.setTitle("My List", for: .normal)
        button3.setTitleColor(.white, for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 17.2)
        
        let stackView = UIStackView(arrangedSubviews: [logoImageView, button1, button2, button3])
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 35
        stackView.distribution = .equalSpacing
        
        let stackViewItem = UIBarButtonItem(customView: stackView)
        
        navigationItem.leftBarButtonItems = [
            stackViewItem
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewUI.frame = view.bounds
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let num: Int = PosterModel.modeling.count
        return num
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        let posters = PosterModel.modeling[indexPath.section]
                cell.configure(with: posters)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        if let text = header.textLabel?.text {
                header.textLabel?.text = text.capitalized // Capitalizes the first letter
            }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}
