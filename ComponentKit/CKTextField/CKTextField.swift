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
        view.font = .systemFont(ofSize: 17.0, weight: .regular)
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
        view.backgroundColor = .darkGray

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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension CKTextField {
    private func setupSubviews() {
        self.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
