//
//  HomeViewController.swift
//  CleanSwift
//
//  Created by tmp8ol on 22/02/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Variables
    
    var name: String = ""
    private static let heyKey: String = "Welcome!! "
    
    //MARK: - Private Outlets
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeLabel.text =  HomeViewController.heyKey + name
    }
    
    //MARK: - Actions
    
    @IBAction private func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
