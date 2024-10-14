//
//  NetworkingOperationProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 19/09/24.
//

import Foundation

public protocol NetworkingOperationProtocol: AnyObject {
    func execute<T: Codable>(request: RequestProtocol, responseType: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void)
}
