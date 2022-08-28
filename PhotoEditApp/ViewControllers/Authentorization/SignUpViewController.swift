//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    lazy var signUpView: SignUpView = {
        let view = SignUpView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    private func setupSubViews() {
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
