//
//  HomeViewController.swift
//  instagram
//
//  Created by Ethan Chen on 6/6/21.
//

import Firebase
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Check auth status
        handleNotAuthenticated()
    }

    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil {
            // Show log in
            
            let logInVC = LoginViewController()
            present(logInVC, animated: true)
        }
    }
}
