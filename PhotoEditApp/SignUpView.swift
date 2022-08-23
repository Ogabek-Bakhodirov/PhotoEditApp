//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit
class SignUpView: UIView {
    private lazy var backgroundImage: UIImageView = {
        var view = UIImageView()
        view.image = Images.RegistrationPageImage.images
        view.contentMode = .scaleToFill

        return view
    }()

    private lazy var bottomView: UIView = {
        var view = UIView()
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        return view
    }()

    private lazy var signButtonsStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 25
        return view
    }()

    lazy var signInButton: UIButton = {
        var view = UIButton()
        view.backgroundColor = .clear
        view.setTitle("Sign In", for: .normal)
        view.titleLabel?.font = .montserratMedium(size: 20)
        view.setTitleColor(Colors.baseTextFieldDarkGray.colors, for: .normal)
        return view
    }()

    lazy var signUpButton: UIButton = {
        var view = UIButton()
        view.backgroundColor = .clear
        view.setTitle("Sign Up", for: .normal)
        view.titleLabel?.font = .montserratBold(size: 32)
        view.setTitleColor(Colors.baseTextWhiteColor.colors, for: .normal)
        return view
    }()

    lazy var purpleLine: UIView = {
        var view = UIView()
        view.backgroundColor = Colors.basePurple.colors
        return view
    }()

    private lazy var textFieldsStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()

    lazy var nameTextField: CKTextField = {
        var view = CKTextField()
        view.placeholderText = "Name"

        return view
    }()

    lazy var emailTextField: CKTextField = {
        var view = CKTextField()
        view.placeholderText = "Email"
        return view
    }()

    lazy var passwordTextField: CKTextField = {
        var view = CKTextField()
        view.placeholderText = "password"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubViews() {
        addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.72)
        }
        addSubview(bottomView)
        bottomView.snp.makeConstraints { make in

            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(-41)
            make.height.equalToSuperview().multipliedBy(0.58)
        }
        addSubview(signButtonsStack)
        signButtonsStack.snp.makeConstraints { make in
            make.top.equalTo(bottomView).inset(32)
            make.left.equalToSuperview().inset(32)
        }

        addSubview(purpleLine)
        purpleLine.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.width.equalTo(27)
            make.bottom.equalTo(signButtonsStack).inset(-4)
            make.left.equalTo(signUpButton)
        }
        addSubview(textFieldsStack)
        textFieldsStack.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(32)
            make.top.equalTo(purpleLine).inset(24)
        }
    }
}
