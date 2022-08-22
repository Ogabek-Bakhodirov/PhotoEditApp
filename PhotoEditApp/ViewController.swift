//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupSubViews()
    }

    // YOU can delete this line(16-33)  i just showing how to use Snapkit

    lazy var welcomeLabel: UILabel = {
        var view = UILabel()
        view.text = "Welcome ◎◎"
        view.textColor = .blue
        view.font = .monospacedSystemFont(ofSize: 23, weight: .bold)
        return view
    }()

    lazy var button: UIButton = {
        var view = UIButton()
        view.titleLabel?.text = "click me !!"
        view.backgroundColor = .gray
        return view
    }()

    private func setupSubViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(button)

        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.left.equalToSuperview().inset(150)
        }
        // make is snapkits canstraints maker use it to make constrains
        //
        button.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel).inset(30)
            // buttons top equal to welcoms labels tops + 30 inset
            make.centerX.equalTo(self.view) // buttons center equal to Current VS's view center
            make.height.width.equalTo(200) // width and height equal to 200
        }
    }
}
