//
//  LoginViewController.swift
//  instagram
//
//  Created by Ethan Chen on 6/6/21.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let conerRadius: CGFloat = 8.0
    }
    private let usernameEmailFiled: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.conerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    private let passwordFiled: UITextField = {
        let field = UITextField()
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.isSecureTextEntry = true
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.conerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.conerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton =  {
        let button = UIButton()
        button.setTitle("Privacy policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton =  {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)

        usernameEmailFiled.delegate = self
        passwordFiled.delegate = self

        addSubViews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        headerView.frame = CGRect(x: 0,
                                  y: view.safeAreaInsets.top,
                                  width: view.width,
                                  height: view.height/3.0)
        
        usernameEmailFiled.frame = CGRect(x: 25,
                                  y: headerView.bottom + 40,
                                  width: view.width - 50,
                                  height: 52.0
                                )
        
        passwordFiled.frame = CGRect(x: 25,
                                  y: usernameEmailFiled.bottom + 10,
                                  width: view.width - 50,
                                  height: 52.0
                                )
        
        loginButton.frame = CGRect(x: 25,
                                   y: passwordFiled.bottom + 10,
                                   width: view.width - 50,
                                   height: 52.0
                                 )
        
        
        createAccountButton.frame = CGRect(x: 25,
                                   y: loginButton.bottom + 10,
                                   width: view.width - 50,
                                   height: 52.0
                                 )
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width-20,
                                   height: 50)

        privacyButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 50,
                                   width: view.width-20,
                                   height: 50)
        configureHeaderView()
    }

    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // Add instagram logo
        let imgView = UIImageView(image: UIImage(named: "logo"))
        backgroundView.addSubview(imgView)
        imgView.contentMode = .scaleAspectFit
        imgView.frame = CGRect(x: headerView.width/4.0,
                               y: view.safeAreaInsets.top,
                               width: headerView.width / 2.0,
                               height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubViews(){
        view.addSubview(usernameEmailFiled)
        view.addSubview(passwordFiled)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton(){
        passwordFiled.resignFirstResponder()
        usernameEmailFiled.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailFiled.text, !usernameEmail.isEmpty,
              let password = passwordFiled.text, !password.isEmpty, password.count > 8 else {
            return
        }
        
        // Login functionality
    }
    
    @objc private func didTapTermsButton(){
        guard let url = URL(string: "https://www.facebook.com/help/instagram/termsofuse") else {
            return
        }
       
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapPrivacyButton(){
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
       
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    @objc private func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailFiled {
            passwordFiled.becomeFirstResponder()
        } else if textField == passwordFiled {
             didTapLoginButton()
        }

        return true
    }
}
