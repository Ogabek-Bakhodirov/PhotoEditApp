//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

class RegistrationCarView: UIView {
    private lazy var mainView: UIView = {
        var view = UIView()
        view.backgroundColor = Colors.baseBackgroundDark.colors
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
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

    private func setupSubViews() {}
}
