//
//  Resolver+Ext.swift
//  MovieFlix
//
//  Created by Doni Silva on 25/09/24.
//

import Foundation
import Swinject

extension Resolver {
    private var resolver: Resolver {
        return self
    }
    
    public func resolveUnwrapping<Service>(_ serviceType: Service.Type) -> Service {
        if let resolution = resolver.resolve(serviceType) {
            return resolution
        }
        fatalError("\(serviceType) resolution failed")
    }
    
    public func resolveUnwrapping<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        if let resolution = resolver.resolve(serviceType, argument: argument) {
            return resolution
        }
        fatalError("\(serviceType) resolution failed")
    }
}
