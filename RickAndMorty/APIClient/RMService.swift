//
//  RMService.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation

/* RMService: responsible for making api calls */

// Built as a singleton :  a class that allows only a single instance of itself to be created and gives access to that created instance.
final class RMService { // Primary API service object to get DATA
    
    // building singleton https://stackoverflow.com/questions/37701187/when-to-use-static-constant-and-variable-in-swift
    static let shared = RMService() // Often a static constant is used to adopt the Singleton pattern. In this case we want no more than 1 instance of a class to be allocated. To do that we save the reference to the shared instance inside a constant and we do hide the initializer.
    
    // force everyone to use the singleton, only 1 variable lives
    private init(){} // privatized constructor
    
    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>( // T here is any object model, its a generic function to avoid repetition that conforms with Codable
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void)// @escape informs called of a function that takes a closure . https://www.swiftbysundell.com/articles/the-power-of-result-types-in-swift/,
    {
        // lets check if we actually have a request.
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, error in
            // lets make sure we got some data
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            // Decode the response
            do {
                let result = try JSONDecoder().decode(type.self, from: data) // decode the whatever the parameter was
                completion(Result.success(result))
            }catch {
                completion(Result.failure(error)) // competion once the data is not transmitted 
            }
        })
        task.resume() // kicks off the task for the url session
            
    }
    
    // MARK: Private
    // Building the request URL from the RMRequest.url we made along the method
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        /*
         URLRequest encapsulates two essential properties of a load request:
            1. the URL to load
            2. the policies used to load it.
         In addition, for HTTP and HTTPS requests, URLRequest includes the HTTP method (GET, POST, and so on) and the HTTP headers.
         */
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod // attach the method as well
        return request
    }
    
}


















