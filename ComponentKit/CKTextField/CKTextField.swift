//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import Foundation
import UIKit

public class CKTextField: UIView {
    public var title: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    public var text: String? {
        get {
            textfield.text
        }
        set {
            textfield.text = newValue
        }
    }

    public var placeholderText: String? {
        get {
            textfield.placeholder
        }
        set {
            textfield.placeholder = newValue
        }
    }

    public var error: String? { errorLabel.text }

    // Private components
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 10.0, weight: .regular)
        view.textColor = .secondaryLabel

        return view
    }()

    private lazy var textfield: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .montserratRegular(size: 17)
//        view.attributedPlaceholder
        view.textColor = .white

        return view
    }()

    private lazy var errorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 10.0, weight: .regular)
        view.textColor = .systemRed

        return view
    }()

    private lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, textfield, errorLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical

        return view
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1725487709, green: 0.1725491583, blue: 0.1811430752, alpha: 1)

        view.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 6.0),
            contentStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            contentStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -6.0)
        ])

        return view
    }()

    // MARK: - Init

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension CKTextField {
    private func setupSubviews() {
        addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16.0
    }
}

extension UIFont {
    // YOU can use like that: someLabel.font = .montserratBold(size: 40)
    static func montserratLight(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Light", size: size)
    }

    static func montserratRegular(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Regular", size: size)
    }

    static func montserratThin(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Thin", size: size)
    }

    static func montserratMedium(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Medium", size: size)
    }

    static func montserratBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Bold", size: size)
    }

    static func montserratSemiBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-SemiBold", size: size)
    }

    static func montserratExtraBold(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-ExtraBold", size: size)
    }

    static func montserratBlack(size: CGFloat) -> UIFont? {
        UIFont(name: "Montserrat-Black", size: size)
    }
}
