//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

class SignInView: UIView {
    lazy var signInBackgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.im_registration_page_image.image

        return view
    }()

    lazy var registrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.base_background_dark.color
        view.clipsToBounds = true

        return view
    }()

    lazy var topView: CKPageController = {
        let view = CKPageController()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titles = ["Sign In", "Sign Up", "As a Host"]

        return view
    }()

    lazy var emailTextField: CKTextField = {
        let view = CKTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholderText = "Email"

        return view
    }()

    lazy var passwordTextField: CKTextField = {
        let view = CKTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholderText = "Password"

        return view
    }()

    lazy var forgotButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Forgot Password", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13.0)
        view.setTitleColor(Colors.base_purple.color, for: .normal)

        return view
    }()

    lazy var appleIcon: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.ic_apple.image, for: .normal)

        return view
    }()

    lazy var googleIcon: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.ic_google.image, for: .normal)

        return view
    }()

    lazy var nextButton: CKContentActionButton = {
        let view = CKContentActionButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: CKContentActionButtonViewModel(
            text: "Next",
            image: UIImage(systemName: "chevron.right"),
            backgroundColor: Colors.base_purple.color
        ))
        view.layer.cornerRadius = 24.0
        view.clipsToBounds = true

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
        addSubview(signInBackgroundImage)
        addSubview(registrView)
        addSubview(topView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotButton)
        addSubview(appleIcon)
        addSubview(googleIcon)
        addSubview(nextButton)

        signInBackgroundImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.65)
        }

        registrView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.57)
        }

        topView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(32.0)
            make.top.equalTo(registrView).inset(40.0)
            make.right.equalToSuperview().inset(32)
        }

        emailTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(32.0)
            make.height.equalTo(50.0)
            make.top.equalTo(registrView).inset(110.0)
        }

        passwordTextField.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(32.0)
            make.height.equalTo(50.0)
            make.top.equalTo(emailTextField.snp_bottomMargin).inset(-20.0)
        }

        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).inset(-16.0)
            make.right.equalToSuperview().inset(32.0)
            make.left.equalToSuperview().inset(233.0)
            make.height.equalTo(16.0)
        }

        appleIcon.snp.makeConstraints { make in
            make.bottom.equalTo(-32.0)
            make.left.equalTo(32.0)
            make.width.height.equalTo(50.0)
        }

        googleIcon.snp.makeConstraints { make in
            make.bottom.equalTo(-32.0)
            make.left.equalTo(appleIcon.snp_rightMargin).inset(-20.0)
            make.width.height.equalTo(50.0)
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(-32.0)
            make.right.equalTo(-32.0)
            make.left.equalTo(googleIcon.snp_rightMargin).inset(-83.0)
            make.height.equalTo(50.0)
        }
    }
}

extension UIView {
    func roundCornerView(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: .init(width: radius, height: radius)
        )

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
