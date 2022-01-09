//
//  APICaller.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/7/21.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private init () {}
    
    struct Constants {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    
    // dont necassarily need, but makes code cleaner
    enum APIError: Error {
        case failedToGetData
    }
    
    
    // get user profile API call
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/me"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    }
    
    // search API
    // get user profile API call
    public func searchItems(query: String, completion: @escaping (Result<SearchItems, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/search?q=\(query)&type=artist,track,album&limit=5"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(SearchItems.self, from: data)
                    //let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    }
    
    // get user top items
    public func getCurrentUserTopItems(completion: @escaping (Result<UserTopItems, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/me/top/artists?limit=20"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserTopItems.self, from: data)
                    //let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    //print(result)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    // get recently played tracks
    public func getRecentlyPlayedTracks(completion: @escaping((Result<RecentlyPlayedTracks, Error>) -> Void)) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/me/player/recently-played?limit=10"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    //let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    //print(result)
                    let result = try JSONDecoder().decode(RecentlyPlayedTracks.self, from: data)
                    completion(.success(result))
                    
                    
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    }
    
    
    // MARK: private
    
    enum HTTPMethod: String{
        case GET
        case POST
    }
    
    
    // Basically a helper function that returns a url request on completion so we dont have to make this request parameter numerous times - makes it more reusable
    private func createRequest(with url: URL?,
                               type: HTTPMethod,
                               completion: @escaping (URLRequest) -> Void) {
        
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else {return}
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            
            completion(request)
            
        }
        
    }
    
}
