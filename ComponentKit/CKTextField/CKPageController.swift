//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit

public class CKPageController: UIView {
    public var onChanged: ((Int) -> Void)?
    public var titles: [String] = [] {
        didSet {
            populateViews()
        }
    }

    lazy var contentStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.base_background_dark.color
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 24.0

        return view
    }()

    private var stacks: [UIStackView] = []
    private var selectedTitleId: Int = 0 {
        didSet {
            didSelectTitle()
        }
    }

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
    }

    private func populateViews() {
        contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        stacks = []

        titles.enumerated().forEach { index, title in
            let buttonStack = makeButtonStack(title: title, index: index, isSelected: selectedTitleId == index)
            contentStack.addArrangedSubview(buttonStack)
            stacks.append(buttonStack)
        }
        contentStack.addArrangedSubview(UIView())
    }
}

// MARK: - Generate Views

extension CKPageController {
    private func makeButtonStack(title: String, index: Int, isSelected: Bool) -> UIStackView {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = .clear
        button.tag = index
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
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

        makeSelectedStyle(for: button, lineView: lineView, isSelected: isSelected)

        let stackView = makeStackView(arrangedSubviews: [button, lineView])

        return stackView
    }

    private func makeStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading

        return stackView
    }

    private func makeSelectedStyle(for button: UIButton, lineView: UIView, isSelected: Bool) {
        if isSelected {
            button.setTitleColor(Colors.base_text_white_color.color, for: .normal)
            button.titleLabel?.font = .montserratBold(size: 32)
            button.titleLabel?.minimumScaleFactor = 12.0
        } else {
            button.setTitleColor(Colors.base_text_field_dark_gray.color, for: .normal)
            button.titleLabel?.font = .montserratMedium(size: 20)
            button.titleLabel?.minimumScaleFactor = 12.0
        }
        lineView.isHidden = !isSelected
    }
}

// MARK: - Controller logic

extension CKPageController {
    func didSelectTitle() {
        stacks.forEach { stack in
            guard let button = stack.arrangedSubviews.first as? UIButton,
                  let lineView = stack.arrangedSubviews.last else {
                return
            }
            makeSelectedStyle(for: button, lineView: lineView, isSelected: button.tag == selectedTitleId)
        }
    }

    @objc func touchUpInside(button: UIButton) {
        selectedTitleId = button.tag
        onChanged?(selectedTitleId)
    }
}
