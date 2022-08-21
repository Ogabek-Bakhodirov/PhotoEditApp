//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import Foundation
import UIKit

public class CKTextField: UIView {
    private lazy var textfield: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var textfield2: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var textfield3: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var textfield4: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

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

    }
}
