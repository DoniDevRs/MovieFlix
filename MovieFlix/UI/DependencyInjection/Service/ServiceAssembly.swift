//
//  ServiceAssembly.swift
//  MovieFlix
//
//  Created by Doni Silva on 25/09/24.
//

import Foundation
import Swinject

final class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NetworkingOperationProtocol.self) { resolver in
            return NetworkingOperation()
        }
        
        container.register(ServiceProtocol.self) { resolver in
            let operation = resolver.resolveUnwrapping(NetworkingOperationProtocol.self)
            return ServiceImplementation(operation: operation)
        }
    }
}
