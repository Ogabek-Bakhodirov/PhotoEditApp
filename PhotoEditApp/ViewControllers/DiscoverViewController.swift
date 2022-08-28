//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

class DiscoverViewController: UIViewController {
    lazy var discoverView: DiscoverView = {
        let view = DiscoverView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        view.backgroundColor = Colors.base_background_dark.color
    }

    private func setupSubViews() {
        view.addSubview(discoverView)
        discoverView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
