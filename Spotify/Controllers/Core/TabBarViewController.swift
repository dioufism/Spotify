//
//  TabBarViewController.swift
//  Spotify
//
//  Created by ousmane diouf on 3/10/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabScreen()

    }
    

    func configureTabScreen() {
        
        //initialize the view controller
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = LibraryViewController()
        
        //give each VC a title and assign large titles
        vc1.title = "Browse"
        vc2.title = "Search"
        vc3.title = "Library"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always

        // embed the VCs above inside a navigation controller
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        //define the tabar item and their logos
        nav1.tabBarItem =  UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 1)
        nav2.tabBarItem =  UITabBarItem(title: "Search", image: UIImage(named: "magnifyingglass"), tag: 1)
        nav3.tabBarItem =  UITabBarItem(title: "Library", image: UIImage(named: "house"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true



    }

}
