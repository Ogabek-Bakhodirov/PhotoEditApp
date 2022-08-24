//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

class CustomTextField: UIView {
    var title = "Email"
    var lengthCount: Int = 6
    lazy var text = textField.text

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = title
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        view.textColor = .systemGray2
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.isHidden = true

        return view
    }()

    lazy var textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        view.textColor = .black
        view.delegate = self
        view.attributedPlaceholder = placeHolderAttributesString

        return view
    }()

    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray2

        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = Images.ic_eyeSlash.images

        return view
    }()

    private var placeHolderAttributesString: NSAttributedString {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray2,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .medium)
        ]

        return NSAttributedString(string: title, attributes: attributes)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        validate(with: textField.text!)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(lineView)
        addSubview(iconImageView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: textField.topAnchor),

            textField.leftAnchor.constraint(equalTo: leftAnchor),
            textField.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -5.0),

            iconImageView.leftAnchor.constraint(equalTo: textField.rightAnchor),
            iconImageView.rightAnchor.constraint(equalTo: rightAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 23.0),
            iconImageView.widthAnchor.constraint(equalToConstant: 30.0),

            lineView.leftAnchor.constraint(equalTo: leftAnchor),
            lineView.rightAnchor.constraint(equalTo: rightAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        titleLabel.isHidden = false
        textField.attributedPlaceholder = nil
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        titleLabel.isHidden = (textField.text?.isEmpty ?? true) ? true : false
        textField.attributedPlaceholder = placeHolderAttributesString
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if string.isEmpty {
            var string = textField.text!
            string.removeLast()
            validate(with: string)
        } else {
            validate(with: textField.text! + string)
        }

        return true
    }

    private func validate(with string: String) {
        if string.count > lengthCount {
            lineView.backgroundColor = .green
//            iconImageView.image = Images.ic_eyeSlash.images
        } else {
            lineView.backgroundColor = .systemGray2
            iconImageView.image = nil
        }
    }
}
