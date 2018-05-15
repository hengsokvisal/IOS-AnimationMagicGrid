//
//  APIRepository.swift
//  APIKitSelfTraining
//
//  Created by HengVisal on 5/10/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import APIKit
class APIRepoSitory{
    
    func sentRequest(){
        let request = ApiInfo(name: "suguru.sasaki@quad.co.jp", grant_type: "password", password: "abc123", client_secret: "7d1rKIZCc80wQVEDk95uesFwUQnOGFpz7HPQGSbm", client_id: "3")
        print("sent request?")
        Session.send(request){ result in
            switch result {
            case .success(let apiResult):
                print(apiResult)
            case .failure(let error):
                print("error1: \(error)")
            }
        }
    }
}

struct ApiInfo : Request {
    typealias Response = ApiResult
    
    let name : String?
    let grant_type : String?
    let password : String?
    let client_secret : String?
    let client_id : String?

    var baseURL: URL{
        return URL(string: "https://nsapp.neurospace.jp")!
    }
    var path: String{
        return "/oauth/token"
    }
    var parameters: Any? {
        let params =
        ["username": self.name,
         "grant_type": self.grant_type,
         "password" : self.password,
         "client_secret": self.client_secret,
         "client_id": self.client_id]
        return params
    }
    var headerFields: [String : String]{
        return [
            "Accept": "application/json",
            "Accept-Encoding": "gzip"
        ]
    }
    var method: HTTPMethod{
        return .post
    }
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> ApiResult {
        return try ApiResult(object:object)
    }
    
}

struct ApiResult {
    let token_type : String?
    let expires_in : Int?
    let access_token : String?
    let refresh_token : String?
    let user_id : Int?
    
    init(object : Any) throws {
        guard let json = object as? [String : Any] ,
        let token_type = json["token_type"] as? String? ,
        let expires_in = json["expires_in"] as?Int? ,
        let access_token = json["access_token"] as? String ,
        let refresh_token = json["refresh_token"] as? String? ,
            let user_id = json["user_id"] as? Int? else { throw ResponseError.unexpectedObject(object)
        }
        self.token_type = token_type
        self.expires_in = expires_in
        self.access_token = access_token
        self.refresh_token = refresh_token
        self.user_id = user_id
    }
}
