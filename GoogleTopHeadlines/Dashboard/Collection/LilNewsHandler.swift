//
//  LilNewsHandler.swift
//  GoogleTopHeadlines
//
//  Created by HalitG on 13.02.2021.
//  Copyright © 2021 HalitG. All rights reserved.
//

import UIKit

class LilNewsHandler: NewsCollectionHandler {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LilNewsCell.identifier, for: indexPath) as! LilNewsCell

        let article = items[indexPath.row]
        cell.load(article: article, downloader: ImageDownloader.shared)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

}
