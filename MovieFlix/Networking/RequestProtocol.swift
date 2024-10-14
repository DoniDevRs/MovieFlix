//
//  RequestProtocol.swift
//  MovieFlix
//
//  Created by Doni Silva on 19/09/24.
//

import Foundation
import Alamofire

public protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: Parameters? { get }
}
