//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import ComponentKit

class ViewController: UIViewController {
    private lazy var textField: CKTextField = {
        let view = CKTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "example@email.com"
        view.placeholderText = "Email"
        view.title = "Email"

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        view.addSubview(textField)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 6.0),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0),
            textField.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
