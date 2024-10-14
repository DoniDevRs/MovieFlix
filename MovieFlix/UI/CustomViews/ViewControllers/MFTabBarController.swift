//
//  MFTabBarController.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

public class MFTabBarController: UITabBarController {
    
    private enum Constants {
        static let tabBarBorder: CGFloat = 0.5
        static let tabBarCornerRadius: CGFloat = 15
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, CustomTabBar.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = true
        tabBar.tintColor = .systemOrange
        tabBar.backgroundColor = .systemGray5
        
        tabBar.layer.borderWidth = Constants.tabBarBorder
        tabBar.layer.borderColor = UIColor.systemGray5.cgColor
        tabBar.layer.cornerRadius = Constants.tabBarCornerRadius
        tabBar.clipsToBounds = true
    }
}

fileprivate class CustomTabBar: UITabBar {
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 95
        return sizeThatFits
    }
}
