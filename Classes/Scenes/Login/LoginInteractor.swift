//
//  LoginInteractor.swift
//  CleanSwift
//
//  Created by tmp8ol on 24/02/22.
//

import UIKit

protocol LoginBusinessLogic {
    
    func login(request: Request)
}

class LoginInteractor: LoginBusinessLogic {
    
    //MARK: - Variables
    
    var presenter: LoginPresentationLogic?
    
    //MARK: - Functions
    
    func login(request: Request) {
        let userResponse = User(name: "CJK",
                                password: "135",
                                age: 31)
        
        let response = Response(user: userResponse)
        if request.username.caseInsensitiveCompare(response.user.name) == ComparisonResult.orderedSame, request.password == response.user.password {
            self.presenter?.presentLogin(response: response)
        } else {
            self.presenter?.presentLoginFailure(response: response)
        }
    }
}
