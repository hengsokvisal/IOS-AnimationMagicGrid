//
//  HomepagePresenter.swift
//  APIKitSelfTraining
//
//  Created by HengVisal on 5/10/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

class HomepagePresenter{
    let apiRepo : APIRepoSitory = APIRepoSitory()
    func request() -> Void {
        apiRepo.sentRequest()
    }
}
