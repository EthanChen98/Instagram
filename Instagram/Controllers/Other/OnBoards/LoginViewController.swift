//
//  LoginViewController.swift
//  instagram
//
//  Created by Ethan Chen on 6/6/21.
//

import UIKit

class LoginViewController: UIViewController {

    private let usernameEmailFiled: UITextField = {
        return UITextField()
    }()
    
    private let passwordEmailFiled: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton =  {
        return UIButton()
    }()
    
    private let createAccountButton: UIButton =  {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func addSubViews(){
        view.addSubview(usernameEmailFiled)
        view.addSubview(passwordEmailFiled)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton(){}
    @objc private func didTapTermsButton(){}
    @objc private func didTapPrivacyButton(){}
    @objc private func didTapCreateAccountButton(){}

}
