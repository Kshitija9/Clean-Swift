//
//  LoginPresenter.swift
//  CleanSwift
//
//  Created by tmp8ol on 24/02/22.
//

import UIKit

protocol LoginPresentationLogic {
    
    func presentLogin(response: Response)
    func presentLoginFailure(response: Response)
}

class LoginPresenter: LoginPresentationLogic {
    
    //MARK: - Variables
    
    weak var viewController: LoginDisplayLogic?
    
    //MARK: - Functions
    
    func presentLogin(response: Response) {
        let username = response.user.name
        let age = response.user.age
        let viewModel = ViewModelSuccess(username: username, age: age)
        self.viewController?.displayUser(viewModel: viewModel)
    }
    
    func presentLoginFailure(response: Response) {
        let viewModel = ViewModelFailure(errorMessage: "Incorrect User")
        self.viewController?.displayFailure(viewModel: viewModel)
    }
}
