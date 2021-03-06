//
//  DashboardPresenter.swift
//  GoogleTopHeadlines
//
//  Created by HalitG on 13.02.2021.
//  Copyright (c) 2021 HalitG. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DashboardPresentationLogic
{
  func presentArticle(articles: [Article])
}

class DashboardPresenter: DashboardPresentationLogic
{
  weak var viewController: DashboardDisplayLogic?
  
  // MARK: Do something
  
  func presentArticle(articles: [Article])
  {
    viewController?.load(articles: articles)
  }
}
