//
//  NetworkingOperation.swift
//  MovieFlix
//
//  Created by Doni Silva on 19/09/24.
//

import Foundation
import Alamofire

public class NetworkingOperation: NetworkingOperationProtocol {
    
    public init() {}
    
    enum Constants {
        static let apiKey = "api_key"
        static let apiKeyValue = "" // Generate an apikey on The Movies DataBase website
        static let languageKey = "language"
        static let languageKeyValue = "languageKeyValue".localized
    }
    
    public func execute<T>(request: RequestProtocol, responseType: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void) where T : Decodable, T : Encodable {
        guard let urlRequest = self.makeURLRequest(request) else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(urlRequest).responseDecodable(of: T.self) { dataResponse in
            if let _ = dataResponse.error {
                completion(.failure(.unableToComplete))
            }
            
            guard dataResponse.response?.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = dataResponse.data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let serializedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(serializedResponse))
            } catch {
                completion(.failure(.invalidData))
            }
        }
    }
    
    private func makeURLRequest(_ request: RequestProtocol) -> URLRequest? {
        guard var urlComponents = URLComponents(string: request.baseURL + request.path) else {
            return nil
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: Constants.apiKey, value: Constants.apiKeyValue),
            URLQueryItem(name: Constants.languageKey, value: Constants.languageKeyValue)
        ]

        guard let url = urlComponents.url else {
            return nil
        }
        return URLRequest(url: url)
    }
}
