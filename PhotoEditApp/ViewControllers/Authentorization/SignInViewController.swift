//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    lazy var signInView: SignInView = {
        let view = SignInView()
        view.events.signIn = { email, password in
            self.signIn(email: email, password: password)
        }

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    private func setupSubViews() {
        view.addSubview(signInView)
        signInView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

    private func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            guard let strongSelf = self else {
                return
            }

            if let error = error {
                strongSelf.showAlertAction(title: "OK", message: "Wrong informations, try again !! ")
                print(error.localizedDescription)
            } else {
                let vc = DiscoverViewController()
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                strongSelf.present(vc, animated: true, completion: nil)
            }
        }
    }

    public func showAlertAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) in
            print("Action")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true)
    }
}
