//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit

class PhotoCell: UICollectionViewCell {
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .red
        view.clipsToBounds = true
        view.layer.cornerRadius = 10.0

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
        addSubview(image)
        image.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(1.0)
            make.left.equalToSuperview().inset(1.0)
            make.top.equalToSuperview().inset(1.0)
            make.bottom.equalToSuperview().inset(-1.0)
        }
    }
}
