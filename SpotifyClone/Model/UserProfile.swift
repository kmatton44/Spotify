//
//  UserProfile.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/7/21.
//

import Foundation

struct UserProfile: Codable {

    let display_name: String
    let external_urls: [String: String]
    //let followers: [String: Codable?]
    let href: String
    let id: String
    
}
