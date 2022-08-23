//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

struct IconTextButtonViewModel {
    let text: String
    let image: UIImage?
    let backgroundColor: UIColor?
}

class IconTextButton: UIButton {
    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.textAlignment = .center
        view.textColor = .white
        view.font = .systemFont(ofSize: 20.0, weight: .semibold)

        return view
    }()

    lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .white
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        backgroundColor = .systemBlue
    }

    func configure(with viewModel: IconTextButtonViewModel) {
        label.text = viewModel.text
        backgroundColor = viewModel.backgroundColor
        iconImageView.image = viewModel.image
    }

    override func layoutSubviews() {
        addSubview(label)
        addSubview(iconImageView)
        super.layoutSubviews()
        iconImageView.sizeToFit()
        let iconSize: CGFloat = 18
        let iconX: CGFloat = (frame.size.width - iconImageView.frame.size.width - iconSize - 5) / 2
        label.frame = CGRect(x: iconX - 40, y: (frame.size.height - iconSize) / 2, width: 100, height: 20)
        iconImageView.frame = CGRect(
            x: iconX + iconSize + 15,
            y: 0,
            width: iconImageView.frame.size.width + 2,
            height: frame.size.height
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
