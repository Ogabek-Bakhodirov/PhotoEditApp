//
//  SignInView.swift
//  PhotoEditApp
//
//  Created by User 2 on 22/08/22.
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
        view.layer.cornerRadius = 20.0

        return view
    }()

    private func setupSubViews() {
        addSubview(signInBackgroundImage)
        addSubview(registrView)

        signInBackgroundImage.snp.makeConstraints { make in
            make.centerX.self
            make.centerY.self
        }

        registrView.snp.makeConstraints { make in
            make.topMargin.equalTo(300)
            make.height.equalTo(500)
            make.width.equalTo(375)
            make.bottomMargin.equalTo(0)
        }
    }
}
