//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import ComponentKit

class topView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var animateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red

        return view
    }()

    lazy var firstButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.setTitle("Sign IN", for: .normal)
        view.titleLabel?.textColor = Colors.baseTextWhiteColor.colors
        view.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
        view.addTarget(self, action: #selector(signIn), for: .touchUpInside)

        return view
    }()

    lazy var secondButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Sign UP", for: .normal)
        view.titleLabel?.textColor = Colors.baseTextWhiteColor.colors
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.titleLabel?.textColor = .black

        return view
    }()

    lazy var stack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [firstButton, secondButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually

        return view
    }()

    lazy var line1View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.basePurple.colors

        return view
    }()

    lazy var line2View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseBackgroundDark.colors

        return view
    }()

    lazy var lineStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [line1View, line2View])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
//        view.spacing = 40.0
//        view.distribution = .fillEqually

        return view
    }()

    lazy var contentStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stack, lineStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.axis = .vertical

        return view
    }()

    @objc func signIn() {
        line1View.backgroundColor = Colors.basePurple.colors
        line2View.backgroundColor = Colors.baseBackgroundDark.colors
        firstButton.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
        secondButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }

    @objc func signUp() {
        line2View.backgroundColor = Colors.basePurple.colors
        line1View.backgroundColor = Colors.baseBackgroundDark.colors
        secondButton.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
        firstButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }

    func setupSubview() {
        addSubview(contentStack)

        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor),
            contentStack.leftAnchor.constraint(equalTo: leftAnchor),
            contentStack.rightAnchor.constraint(equalTo: rightAnchor),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor),

            line1View.widthAnchor.constraint(equalTo: lineStack.widthAnchor, multiplier: 0.2),
            line1View.leftAnchor.constraint(equalTo: lineStack.leftAnchor, constant: 10.0),
            line2View.widthAnchor.constraint(equalTo: lineStack.widthAnchor, multiplier: 0.2),
            line2View.rightAnchor.constraint(equalTo: lineStack.rightAnchor, constant: -100.0),

            stack.heightAnchor.constraint(equalTo: contentStack.heightAnchor, multiplier: 0.9)
        ])
    }
}
