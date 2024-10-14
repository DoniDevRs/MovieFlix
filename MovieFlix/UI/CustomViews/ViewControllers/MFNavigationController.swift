//
//  MFNavigationController.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

public class MFNavigationController: UINavigationController {
    func defaultConfiguration() {
        setNavigationBarHidden(true, animated: false)
        navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
}
