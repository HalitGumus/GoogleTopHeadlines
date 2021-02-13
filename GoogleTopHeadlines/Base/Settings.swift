//
//  Settings.swift
//  GoogleTopHeadlines
//
//  Created by HalitG on 13.02.2021.
//  Copyright © 2021 HalitG. All rights reserved.
//

import Foundation

struct Settings {
    static var shared = Settings()

    static let StyleKey = "style"
    static let CategoryKey = "category"

    static let StyleDefault: NewsViewModel.Style = .lilnews
    static let CategoryDefault: NewsCategory = .general

    var category: NewsCategory = UserDefaultsConfig.savedCategory {
        didSet {
            UserDefaultsConfig.savedCategory = category
        }
    }

    var style: NewsViewModel.Style = UserDefaultsConfig.savedStyle {
        didSet {
            UserDefaultsConfig.savedStyle = style
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault(Settings.CategoryKey, defaultValue: Settings.CategoryDefault)
    static var savedCategory: NewsCategory

    @UserDefault(Settings.StyleKey, defaultValue: Settings.StyleDefault)
    static var savedStyle: NewsViewModel.Style
}
