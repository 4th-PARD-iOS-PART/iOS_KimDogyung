//
//  ViewController.swift
//  3rd_hw_KimDogyung
//
//  Created by 김도경 on 2024/09/25.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTabBar();
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = SearchViewController()
        let vc3 = ComingSoonViewController()
        let vc4 = DownloadsViewController()
        let vc5 = MoreViewController()
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .black
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(named: "home.png")
        tabBarItems[1].image = UIImage(named: "search.png")
        tabBarItems[2].image = UIImage(named: "coming.png")
        tabBarItems[3].image = UIImage(named: "downloads.png")
        tabBarItems[4].image = UIImage(named: "more.png")
        
        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "Coming Soon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "More"
        
    }


}

