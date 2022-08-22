//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit

class SignInView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var signInBackgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.RegistrationPageImage.images

        return view
    }()

    lazy var registrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.clipsToBounds = true
        view.layer.cornerRadius = 25.0

        return view
    }()

    lazy var signInLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Sign In"
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.textColor = Colors.baseTextWhiteColor.colors

        return view
    }()

    lazy var signUpLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.text = "Sign Up"
        view.textColor = Colors.baseTextFieldDarkGray.colors

        return view
    }()

    lazy var emailTextField: CustomTextField = {
        let view = CustomTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseTextFieldDarkGray.colors
        view.textField.textColor = Colors.baseTextWhiteColor.colors
        view.layer.cornerRadius = 15.0
        view.title = "Email"
        view.clipsToBounds = true
        view.textField.placeholder = "Email"

        return view
    }()

    lazy var passwordTextField: CustomTextField = {
        let view = CustomTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseTextFieldDarkGray.colors
        view.textField.textColor = Colors.baseTextWhiteColor.colors
        view.layer.cornerRadius = 15.0
        view.title = "Password"
        view.clipsToBounds = true
        view.textField.placeholder = "Password"

        return view
    }()

    lazy var forgotButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Forgot Password", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13.0)
        view.setTitleColor(Colors.basePurple.colors, for: .normal)

        return view
    }()

    lazy var appleIcon: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.ic_apple.images, for: .normal)

        return view
    }()

    lazy var googleIcon: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.ic_google.images, for: .normal)

        return view
    }()

    lazy var nextButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Next >", for: .normal)
        view.layer.cornerRadius = 24.0
        view.clipsToBounds = true
        view.backgroundColor = Colors.basePurple.colors

        return view
    }()

    private func setupSubViews() {
        addSubview(signInBackgroundImage)
        addSubview(registrView)
        addSubview(signInLabel)
        addSubview(signUpLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotButton)
        addSubview(appleIcon)
        addSubview(googleIcon)
        addSubview(nextButton)

        NSLayoutConstraint.activate([
            signInBackgroundImage.topAnchor.constraint(equalTo: topAnchor),
            signInBackgroundImage.rightAnchor.constraint(equalTo: rightAnchor),
            signInBackgroundImage.leftAnchor.constraint(equalTo: leftAnchor),
            signInBackgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -300.0),

            registrView.topAnchor.constraint(equalTo: topAnchor, constant: 350.0),
            registrView.rightAnchor.constraint(equalTo: rightAnchor),
            registrView.leftAnchor.constraint(equalTo: leftAnchor),
            registrView.bottomAnchor.constraint(equalTo: bottomAnchor),

            signInLabel.topAnchor.constraint(equalTo: registrView.topAnchor, constant: 40.0),
            signInLabel.leftAnchor.constraint(equalTo: registrView.leftAnchor, constant: 32.0),
            signInLabel.rightAnchor.constraint(equalTo: signUpLabel.leftAnchor, constant: -24.0),
            signInLabel.heightAnchor.constraint(equalToConstant: 40.0),

            signUpLabel.topAnchor.constraint(equalTo: registrView.topAnchor, constant: 40.0),
            signUpLabel.rightAnchor.constraint(equalTo: registrView.rightAnchor, constant: -121.0),
            signUpLabel.heightAnchor.constraint(equalToConstant: 40.0),

            emailTextField.topAnchor.constraint(equalTo: registrView.topAnchor, constant: 110.0),
            emailTextField.rightAnchor.constraint(equalTo: registrView.rightAnchor, constant: -32.0),
            emailTextField.leftAnchor.constraint(equalTo: registrView.leftAnchor, constant: 32.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 50.0),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20.0),
            passwordTextField.rightAnchor.constraint(equalTo: registrView.rightAnchor, constant: -32.0),
            passwordTextField.leftAnchor.constraint(equalTo: registrView.leftAnchor, constant: 32.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50.0),

            forgotButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16.0),
            forgotButton.rightAnchor.constraint(equalTo: registrView.rightAnchor, constant: -32.0),
            forgotButton.leftAnchor.constraint(equalTo: registrView.leftAnchor, constant: 233.0),
            forgotButton.widthAnchor.constraint(equalToConstant: 16.0),

            appleIcon.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 156.0),
            appleIcon.leftAnchor.constraint(equalTo: registrView.leftAnchor, constant: 32.0),
            appleIcon.rightAnchor.constraint(equalTo: googleIcon.leftAnchor, constant: -20.0),
            appleIcon.widthAnchor.constraint(equalToConstant: 50.0),
            appleIcon.heightAnchor.constraint(equalToConstant: 70.0),
            appleIcon.bottomAnchor.constraint(equalTo: registrView.bottomAnchor, constant: -32.0),

            googleIcon.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 156.0),
            googleIcon.rightAnchor.constraint(equalTo: nextButton.leftAnchor, constant: -83.0),
            googleIcon.widthAnchor.constraint(equalToConstant: 50.0),
            googleIcon.heightAnchor.constraint(equalToConstant: 70.0),
            googleIcon.bottomAnchor.constraint(equalTo: registrView.bottomAnchor, constant: -32.0),

            nextButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 124.0),
            nextButton.rightAnchor.constraint(equalTo: registrView.rightAnchor, constant: -32.0),
            nextButton.widthAnchor.constraint(equalToConstant: 108.0),
            nextButton.heightAnchor.constraint(equalToConstant: 50.0),
            nextButton.bottomAnchor.constraint(equalTo: registrView.bottomAnchor, constant: -32.0),

        ])

//        signInBackgroundImage.snp.makeConstraints { make in
//            make.centerX.self
//            make.centerY.self
//        }
//
//        registrView.snp.makeConstraints { make in
//            make.topMargin.equalTo(300)
//            make.height.equalTo(500)
//            make.width.equalTo(375)
//            make.bottomMargin.equalTo(0)
//        }
//
//        signInLabel.snp.makeConstraints { make in
//
//            make.top.equalTo(registrView).offset(10.0)
//            make.right.equalTo(registrView).offset(20.0)
//            make.height.equalTo(20.0)
//            make.width.equalTo(30.0)
//        }
    }
}
