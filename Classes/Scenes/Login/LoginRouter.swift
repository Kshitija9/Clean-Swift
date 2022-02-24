//
//  LoginRouter.swift
//  CleanSwift
//
//  Created by tmp8ol on 24/02/22.
//

import UIKit

protocol LoginRoutingLogic {
    
    func routeToNextScreen(userName: String)
}

class LoginRouter: NSObject, LoginRoutingLogic {
    
    //MARK: - Variables
    
    weak var viewController: LoginViewController?
    
    //MARK: - Functions
    
    func routeToNextScreen(userName: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        destinationVC.name = userName
        self.viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
