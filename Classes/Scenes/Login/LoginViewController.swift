//
//  LoginViewController.swift
//  CleanSwift
//
//  Created by tmp8ol on 24/02/22.
//

import UIKit

protocol LoginDisplayLogic: class
{
    func displayUser(viewModel: ViewModelSuccess)
    func displayFailure(viewModel: ViewModelFailure)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    //MARK: - Variables
    
    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //MARK: - Private outlets
    
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorMessageLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    //MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.login()
    }
    
    // MARK: - Private Functions
    
    private func setup() {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        self.errorMessageLabel.isHidden = true
    }
    
    private func login() {
        guard let userName = userNameTextField.text, let pwd = passwordTextField.text else { return }
        let request = Request(username: userName, password: pwd)
        self.interactor?.login(request: request)
    }
    
    // MARK: - Public Functions
    
    func displayUser(viewModel: ViewModelSuccess) {
        router?.routeToNextScreen(userName: viewModel.username)
        self.errorMessageLabel.isHidden = true
    }
    
    func displayFailure(viewModel: ViewModelFailure) {
        self.errorMessageLabel.text = viewModel.errorMessage
        self.errorMessageLabel.isHidden = false
    }
}
