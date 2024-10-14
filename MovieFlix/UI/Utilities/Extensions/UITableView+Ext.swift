//
//  UITableView+Ext.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
