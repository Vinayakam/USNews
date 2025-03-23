//
//  APIService.swift
//  USNews
//
//  Created by Vinayakam Y on 23/03/25.
//

import Foundation

struct APIService {
    
    func getJson<T: Decodable>(urlString: String,
                               dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                               keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let urlResponse = response as? HTTPURLResponse,
                  urlResponse.statusCode == 200 else {
                throw APIError.invalidURLResponseCode
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = dateDecodingStrategy
            jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try jsonDecoder.decode(T.self, from: data)
                return decodedData
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
    
}


// MARK: - APIError
enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidURLResponseCode
    case dataTaskError(String)
    case decodingError(String)
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The URL path is invalid", comment: "")
        case .invalidURLResponseCode:
            return NSLocalizedString("The http url response code is invalid", comment: "")
        case .dataTaskError(let errorMessage):
            return errorMessage
        case .decodingError(let errorMessage):
            return errorMessage
        }
    }
}
