//
// Copyright © 2014 - 2022 SuperDispatch Inc
// Created by SuperDispatch
//

import UIKit
import SnapKit
import ComponentKit

class DiscoverView: UIView {
    var names = ["Christmas", "Inspration", "Cyber", "Winter"]

    lazy var discoverLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover"
        label.textColor = .white
        label.font = .montserratMedium(size: 32.0)

        return label
    }()

    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search Templates"
        view.searchBarStyle = .minimal
        view.barTintColor = Colors.base_background_dark.color

        return view
    }()

    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(InfoCell.self, forCellWithReuseIdentifier: "InfoCell")
        view.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        view.register(Header.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
        view.backgroundColor = Colors.base_background_dark.color
        view.dataSource = self
        view.delegate = self

        return view
    }()

    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0 {
                let item =
                    NSCollectionLayoutItem(layoutSize: .init(
                        widthDimension: .fractionalWidth(1 / 3),
                        heightDimension: .fractionalHeight(1)
                    ))
                item.contentInsets.bottom = 1.0
                item.contentInsets.leading = 1.0
                item.contentInsets.top = 1.0
                item.contentInsets.trailing = 5.0
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1 / 15)),
                    subitems: [item]
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            } else {
                let singleItem =
                    NSCollectionLayoutItem(layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1 / 3)
                    ))
                singleItem.contentInsets.trailing = 10.0
                singleItem.contentInsets.top = 10.0

                let doubleItem2 =
                    NSCollectionLayoutItem(layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(2 / 3)
                    ))
                doubleItem2.contentInsets.trailing = 10.0
                doubleItem2.contentInsets.top = 10.0

                doubleItem2.contentInsets.top = 10.0
                let doubleGroup2 = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(widthDimension: .fractionalWidth(1 / 2), heightDimension: .fractionalHeight(1)),
                    subitems: [singleItem, doubleItem2]
                )

                let doubleItem =
                    NSCollectionLayoutItem(layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1 / 2)
                    ))
                doubleItem.contentInsets.top = 10.0
                let doubleGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(widthDimension: .fractionalWidth(1 / 2), heightDimension: .fractionalHeight(1)),
                    subitem: doubleItem,
                    count: 2
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(7 / 10)),
                    subitems: [doubleGroup2, doubleGroup]
                )
//                group.contentInsets = .init(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [.init(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)),
                    elementKind: self.categoryHeaderId,
                    alignment: .topLeading
                )]
                return section
            }
        }
        return layout
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: headerId,
            for: indexPath
        )
        return header
    }

    let headerId = "headerId"
    let categoryHeaderId = "categoryHeaderId"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubviews() {
        addSubview(discoverLabel)
        discoverLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(42.0)
            make.left.equalToSuperview().inset(32.0)
            make.right.equalToSuperview().inset(198.0)
            make.height.equalTo(145.0)
        }
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(23.0)
            make.right.equalToSuperview().inset(23.0)
            make.top.equalTo(discoverLabel.snp_bottomMargin).inset(24.0)
            make.height.equalTo(50.0)
        }
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp_bottomMargin).inset(-24.0)
            make.right.equalToSuperview().inset(32.0)
            make.left.equalToSuperview().inset(32.0)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
}

extension DiscoverView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as? InfoCell else {
                return UICollectionViewCell()
            }
            cell.text.text = "\(names[indexPath.row])"
            cell.layer.cornerRadius = 20.0
            return cell
        } else {
            guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
                return UICollectionViewCell()
            }
            cell.image.image = Images.ic_apple.image
            cell.backgroundColor = .green
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else {
            return 8
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
}

class Header: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Featured Templates"
        view.textColor = .white
        view.font = .montserratMedium(size: 17.0)

        return view
    }()

    func setupSubviews() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(15.0)
            make.bottom.equalToSuperview().inset(1.0)
        }
    }
}
