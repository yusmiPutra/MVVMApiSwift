//
//  NewsViewModel.swift
//  MVVM Api
//
//  Created by Yusmi Putra on 7/27/23.
//

import Foundation

class NewsViewModel {
    let responseNews = Bindable<ResponseNews>()
    let error = Bindable<NSError>()
    
    
    func getNews() {
        NewsService.shared.getNews {
            success in
            self.responseNews.value = success
        } error: { error in
            self.error.value = error
        }
    }
}
