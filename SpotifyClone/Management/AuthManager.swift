//
//  AuthManagement.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/6/21.
//

import Foundation


//Class to help handle all my my authorization needs

public class AuthManager {
    
    static let shared = AuthManager()
    
    private var refreshingToken = false
    
    struct Constants {
        static let clientID = "10315558775948abb624ec5aabc658b7"
        static let clientSecret = "54c3097993c44adb819a7090ae7a680d"
        static let reDirectURI = "https://kmdeveloping.wordpress.com/2019/07/21/support-info/"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let scopes = "user-read-recently-played%20user-read-email%20user-read-private%20user-read-recently-played%20user-top-read"
    }
    
    private init () {}
    
    
    // the sign in URL to get the access token
    public var signInURL: URL? {
        var url = "https://accounts.spotify.com/authorize"
        
        url += "?response_type=code"
        url += "&client_id=\(Constants.clientID)"
        url += "&scope=\(Constants.scopes)"
        url += "&redirect_uri=\(Constants.reDirectURI)"
        url += "&show_dialog=TRUE"
        
        return URL(string: url)
    }
    
    var isSignedIn: Bool {
        return accessToken != nil
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    private var refreshToken: String? {
        return UserDefaults.standard.string(forKey: "refresh_token")
    }
    
    private var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: "expirationDate") as? Date
    }
    
    private var shouldRefreshToken: Bool {
        //return with 5 minutes left
        guard let expirationDate = tokenExpirationDate else {return false}
        
        let currentDate = Date()
        let fiveMinutes: TimeInterval = 500
        
        return currentDate.addingTimeInterval(fiveMinutes) >= expirationDate
        
        
    }
    
    
    public func exchangeCodeForToken(code: String, completion: @escaping((Bool) -> Void)) {
        
        // make api call - get token
        guard let url = URL(string: Constants.tokenAPIURL) else {return}
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: Constants.reDirectURI)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Failure to get base 64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            do{
                //To get the json
                //let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                // now that we know json structure, use a decoder
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                
                // Now cache token
                self?.cacheToken(result: result)
                
               
                self?.onRefreshBlocks.forEach{ $0(result.access_token)}
                self?.onRefreshBlocks.removeAll()
                
                completion(true)
                
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
            
            
            
        }
        task.resume()
        
        
    }
    
    
    private var onRefreshBlocks = [(String) -> Void]()
    
    // Supplies valid token to be used with API calls
    // makes sure that an edge case
    public func withValidToken(completion: @escaping (String) -> Void) {
        
        //want to make sure we arent already refreshing a new token
        guard !refreshingToken else {
            //if we ARE currently refreshing
            onRefreshBlocks.append(completion)
            //append the completion
            return
        }
        
        if shouldRefreshToken {
            // Refresh
            refreshIfNeeded { [weak self] success in
                
                if let token = self?.accessToken, success{
                    completion(token)
                }
                
            }
        }
        else if let token = accessToken{
            completion(token)
        }
    }
    
    public func refreshIfNeeded(completion: @escaping (Bool) -> Void) {
        
        guard !refreshingToken else {
            return
        }
        guard shouldRefreshToken else {
            completion(true)
            return
        }
         
        guard let refreshToken = self.refreshToken else {
            return
        }
        
        refreshingToken = true
        
        //Refresh token  with api call
        guard let url = URL(string: Constants.tokenAPIURL) else {return}
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: refreshToken)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Failure to get base 64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            self?.refreshingToken = false
            
            
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            do{
                //To get the json
                //let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                // now that we know json structure, use a decoder
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                
                // Now cache token
                self?.cacheToken(result: result)
                
                print("SUCCESSFULLY REFRESHED")
                
                self?.onRefreshBlocks.forEach{ $0(result.access_token)}
                self?.onRefreshBlocks.removeAll()
                
                completion(true)
                
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
            
            
            
        }
        task.resume()
        
        
    }
    
    
    private func cacheToken(result: AuthResponse) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
        
        if let refresh_token = result.refresh_token {
            UserDefaults.standard.setValue(refresh_token, forKey: "refresh_token")
        }
        
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey: "expirationDate")
    }
    
}
