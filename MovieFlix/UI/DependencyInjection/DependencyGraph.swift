//
//  DependencyGraph.swift
//  MovieFlix
//
//  Created by Doni Silva on 25/09/24.
//

import Foundation
import Swinject

public final class DependencyGraph {
    
    public static func build() -> [Assembly] {
        return [
            ModuleAssembly(),
            ServiceAssembly(),
            DomainAssembly()
        ]
    }
}
