//
//  NewsViewModel.swift
//  GoogleTopHeadlines
//
//  Created by HalitG on 13.02.2021.
//  Copyright © 2021 HalitG. All rights reserved.
//

import UIKit

class NewsViewModel {

    var controller: DashboardViewController

    var style: Style = Settings.shared.style

    var categoryName: String = ""
    var searchKey: String = ""
    
    init(controller: DashboardViewController) {
        self.controller = controller
    }

    func load(searchKey: String) {
        loadArticles(searchKey: searchKey)
        controller.load()
    }

    func loadArticles(category: String = Settings.shared.category.rawValue, searchKey: String) {
        let url = NewsApi.urlForCategory(category: category, searchKey: searchKey)
        NewsApi.getArticles(url: url) { [weak self] (articles) in
            guard let articles = articles else { return }
            self?.controller.load(articles: articles)
            self?.controller.load()
        }

        categoryName = category.capitalized

        let title = style.display + " - " + categoryName
        controller.load(title: title)
    }

    func select(category: String, searchKey: String) {
        loadArticles(category: category, searchKey: searchKey)

        guard let newsCategory = NewsCategory(rawValue: category) else { return }
        Settings.shared.category = newsCategory
    }

    func select(_ aStyle: Style) {
        style = aStyle
        controller.load()

        let title = style.display + " - " + categoryName
        controller.load(title: title)

        Settings.shared.style = style
    }

    var categoryMenu: UIMenu {
        let menuActions = NewsCategory.allCases.map({ (item) -> UIAction in
            let name = item.rawValue
            return UIAction(title: name.capitalized, image: UIImage(systemName: item.systemName)) { (_) in
                self.select(category: name, searchKey: self.searchKey)
            }
        })

        return UIMenu(title: "Change Category", children: menuActions)
    }

    var styleMenu: UIMenu {
        let menuActions = NewsViewModel.Style.allCases.map { (style) -> UIAction in
            return UIAction(title: style.display, image: nil) { (_) in
                self.select(style)
            }
        }

        return UIMenu(title: "Change Style",children: menuActions)
    }

    enum Style: String, CaseIterable, Codable {

        case lilnews

        var display: String {
            switch self {
            case .lilnews:
                return "lil news"
            default:
                return self.rawValue.capitalized
            }
        }

        var isTable: Bool {
            switch self {
            case .lilnews:
                return false
            default:
                return true
            }
        }

        var identifiers: [String] {
            switch self {
            case .lilnews:
                return [LilNewsCell.identifier]
            }
        }

    }

}
