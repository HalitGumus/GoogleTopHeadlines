//
//  NewsCollectionHandler.swift
//  GoogleTopHeadlines
//
//  Created by HalitG on 13.02.2021.
//  Copyright © 2021 HalitG. All rights reserved.
//

import UIKit

class NewsCollectionHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var items: [Article] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        guard let url = item.url else { return }

        UIApplication.shared.open(url)
    }

}
