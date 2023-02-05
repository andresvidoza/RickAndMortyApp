//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation

/* RMRequest: responsible for making native types to build requests */


/// Object that represents a single API Call
final class RMRequest{
    // Base URL
    // Endpoint
    // Path components
    // Query Paramaters ? optionals
    
    /// These are the API constants
    private struct Constants { // lets not make them accessible outside this scope
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    // class variables
    
    /// Desired Endpoint
    private let endpoint: RMEndpoint
    /// Path components for API, if any
    private let pathComponents: Set<String>
    /// Query Arguments for API, if any.
    private let queryParameters: [URLQueryItem]// A single name-value pair from the query portion of a URL
    /// Constructed url for the API request in string format
    private var urlString: String {
        // constructing the string for the endpoint
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue // character, location, episode
        
        // if not empty lets continue the construction
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        // if not empty lets continue the construction
        if !queryParameters.isEmpty {
            string += "?" // start with this query
            
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Dsired HTTP method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Cosntruct Request
    /// - Parameters:
    ///   - endpoint: Target enpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: qCollection of query parameters
    public init(
        
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [], // we may or may not have them ( set is better because remember elements in a set are unique cannot repeat)
        queryParameters: [URLQueryItem] = [] // we may or may not have them
    ) {
        self.endpoint = endpoint
        self.queryParameters = queryParameters
        self.pathComponents = pathComponents
    }
    
    
    
    
}
