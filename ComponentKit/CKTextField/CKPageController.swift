//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit

public class CKPageController: UIView {
    public var titles: [String] = [] {
        didSet {
            populateViews()
        }
    }

    lazy var stacks: [UIView] = []

    lazy var contentStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.base_background_dark.color
        view.axis = .horizontal
        view.distribution = .fillEqually

        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubview() {
        addSubview(contentStack)

        contentStack.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }

        populateViews()
    }

    private func populateViews() {
        contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }

        titles.forEach { title in
            let buttonStack = makeButtonStack(title: title)
            contentStack.addSubview(buttonStack)
        }
    }
}

// MARK: - Generate Views

extension CKPageController {
    private func makeButtonStack(title: String) -> UIView {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.base_background_dark.color
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = Colors.base_text_white_color.color
        button.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
        button.snp.makeConstraints { make in
            make.height.equalTo(40.0)
        }

        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = Colors.base_purple.color
        lineView.snp.makeConstraints { make in
            make.height.equalTo(4.0)
            make.width.equalTo(27.0)
        }

        let stackView = UIStackView(arrangedSubviews: [button, lineView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3.0
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.addSubview(button)
        stackView.addSubview(lineView)

        return stackView
    }
}

// MARK: - Controller logic

extension CKPageController {
    @objc func signIn() {
//        line1View.backgroundColor = Colors.basePurple.colors
//        line2View.backgroundColor = Colors.baseBackgroundDark.colors
//        firstButton.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
//        secondButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }

    @objc func signUp() {
//        line2View.backgroundColor = Colors.basePurple.colors
//        line1View.backgroundColor = Colors.baseBackgroundDark.colors
//        secondButton.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
//        firstButton.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
    }
}
