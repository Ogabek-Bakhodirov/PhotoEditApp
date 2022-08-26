//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

class InfoCell: UICollectionViewCell {
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.base_background_dark.color
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 1

        return view
    }()

    lazy var text: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = .white
        view.font = .montserratMedium(size: 15.0)

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubviews() {
        addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
//            make.top.equalToSuperview().inset(2.0)
//            make.right.equalToSuperview().inset(2.0)
//            make.left.equalToSuperview().inset(2.0)
//            make.bottom.equalToSuperview().inset(-2.0)
        }
        addSubview(text)
        text.snp.makeConstraints { make in
            make.right.equalTo(backView.snp_rightMargin).inset(1.0)
            make.left.equalTo(backView.snp_leftMargin).inset(1.0)
            make.top.equalTo(backView.snp_topMargin).inset(1.0)
            make.bottom.equalTo(backView.snp_bottomMargin).inset(-1.0)
        }
    }
}
