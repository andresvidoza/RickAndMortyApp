//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation

/*
 
 RMRequest: responsible for making native types to build requests
 
 Any call site that that wants to make a request to the API, should create one of these RMRequest objects and via the RMRequest object, we should pass it to the RMService and get our request back.
 
 */


/// Object that represents a single API Call
final class RMRequest{

    // BASE URL
    /// These are the API constants
    private struct Constants { // lets not make them accessible outside this scope
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    // class variables
    
    // BUILDING THE URL PAST THE BASE URL
    /// Desired Endpoint
    private let endpoint: RMEndpoint
    /// Path components for API, if any
    private let pathComponents: [String]
    /// Query Arguments for API, if any.
    private let queryParameters: [URLQueryItem]// A single name-value pair from the query portion of a URL
    /// Constructed url for the API request in string format
    private var urlString: String {
        
        // 1. BUILD WITH ENDPOINT
        // constructing the string for the endpoint
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue // character, location, episode
        
        // 2. BUILD WITH PATH COMPONENT
        // if not empty lets continue the construction
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        // 3. BUILD WITH QUERY PARAMATERS
        // if not empty lets continue the construction
        if !queryParameters.isEmpty {
            string += "?" // start with this query
            
            let argumentString = queryParameters.compactMap({ // RETURNS AN ARRAY IN STRINGS
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&") // this makes they array become a string
            
            string += argumentString
        }
        
        return string
    }
    
    // Variable to Access the constructed URL
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString) // make it a URL object
    }
    
    /// Desired HTTP method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Cosntruct Request
    /// - Parameters:
    ///   - endpoint: Target enpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of Query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [], // we may or may not have them ( set is better because remember elements in a set are unique cannot repeat)
        queryParameters: [URLQueryItem] = [] // we may or may not have them
    ) {
        self.endpoint = endpoint
        self.queryParameters = queryParameters
        self.pathComponents = pathComponents
    }
    
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
