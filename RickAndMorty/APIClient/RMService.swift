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
    private init(){
        
    }
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>( // T here is any object model
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping(Result<T, Error>) -> Void)// @escape informs called of a function that takes a closure
        {
            
        }
    
}
