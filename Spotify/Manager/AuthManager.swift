//
//  AuthManager.swift
//  Spotify
//
//  Created by ousmane diouf on 3/10/21.
//

import Foundation


final class AuthManager {
    
    static let shared = AuthManager()
    private init() {}
    
    struct Constants {
        static let clientID: String = "a883bf1cdeb34417b16fd09968bb4d41"
        static let clientSecret: String = "2c35d483b2e94c308f96fcda424ad2e5"
    }
//MARK: - class Properties
    
     var isSignedIn: Bool {
        return false
    }
    
    public var signInURL: URL?  {
        let scopes = "user-read-private"
        let redirectURI = "https://iosacademy.io"
        let base  =  "https://accounts.spotify.com/authorize"
        let URLstring  = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: URLstring)
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    private var tokenExpirationDate: Date? {
        return nil
    }
    private var shouldRefreshToken: Bool {
        return false
    }
    
    //public func exchangeCodeForToken(code: String, @escaping completion: (Bool) ->Void) {
        //get token
        
    }
    
    private func refreshAccessToken() {
        
    }
    private func cacheToken() {
        
    }

