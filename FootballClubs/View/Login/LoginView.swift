//
//  LoginView.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 26. 10. 2021..
//

import Foundation
import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject {
    func didClickLogin()
}

class LoginView: UIView {
    public var delegate: LoginViewDelegate?
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.addTarget(self,
                         action: #selector(login),
                         for: .touchUpInside)
        return loginButton
    }()
    
    let registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .blue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 15
        registerButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        registerButton.layer.borderWidth = 2.0
        registerButton.layer.borderColor = UIColor.white.cgColor
        return registerButton
    }()
    
    let forgotPasswordButton: UIButton = {
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.backgroundColor = .blue
        forgotPasswordButton.setTitleColor(.white, for: .normal)
        forgotPasswordButton.layer.cornerRadius = 15
        forgotPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        forgotPasswordButton.layer.borderWidth = 2.0
        forgotPasswordButton.layer.borderColor = UIColor.white.cgColor
        return forgotPasswordButton
    }()
    
    let usernameLabel: UILabel = {
       let usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.textColor = .white
        return usernameLabel
    }()
    
    let passwordLabel: UILabel = {
       let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        return passwordLabel
    }()
    
    let usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.backgroundColor = .white
        usernameTextField.borderStyle = .line
        return usernameTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        passwordTextField.borderStyle = .line
        return passwordTextField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoginView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoginView() {
        addSubViews()
        setupConstraints()
    }
    

}

//MARK: - AddSubViews
extension LoginView {
    private func addSubViews() {
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(forgotPasswordButton)
        addSubview(usernameLabel)
        addSubview(passwordLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
    }
}

//MARK: - AddConstraints
extension LoginView {
    func setupConstraints() {
        setupLoginButtonConstraints()
        setupRegisterButtonConstraints()
        setupForgotPasswordButtonConstraints()
        setupUsernameLabelConstraints()
        setupPasswordLabelConstraints()
        setupUsernameTextFieldConstraints()
        setupPasswordTextFieldConstraints()
    }
    
    func setupLoginButtonConstraints() {
        loginButton.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
    }
    
    func setupRegisterButtonConstraints() {
        registerButton.snp.makeConstraints() {
            $0.centerX.equalTo(loginButton)
            $0.top.equalTo(loginButton.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(loginButton)
        }
    }
    
    func setupForgotPasswordButtonConstraints() {
        forgotPasswordButton.snp.makeConstraints() {
            $0.centerX.equalTo(registerButton)
            $0.top.equalTo(registerButton.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(loginButton)
        }
    }
    
    func setupUsernameLabelConstraints() {
        usernameLabel.snp.makeConstraints() {
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            $0.width.equalTo(100)
        }
    }
    
    func setupPasswordLabelConstraints() {
        passwordLabel.snp.makeConstraints() {
            $0.leading.equalTo(usernameLabel)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(30)
            $0.width.equalTo(usernameLabel)
        }
    }
    
    func setupUsernameTextFieldConstraints() {
        usernameTextField.snp.makeConstraints() {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(usernameLabel.snp.bottom).offset(10)
        }
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.snp.makeConstraints() {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
        }
    }
}

private extension LoginView {
    @objc func login() {
        print("Clicked login")
        delegate?.didClickLogin()
    }
}
