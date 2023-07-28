//
//  NewsService.swift
//  MVVM Api
//
//  Created by Yusmi Putra on 7/27/23.
//

import Foundation
import Alamofire

class NewsService {
    public static let shared = NewsService()
    
    func getNews(success : @escaping (_ success: ResponseNews) -> Void,
                 error :@escaping (_ error : NSError) -> Void
    ) {
        
        AF.request("\(Api.baseUrl)/v2/everything?q=tesla&from=2023-06-26&sortBy=publishedAt&apiKey=eb0c5e64398b4618a44f964a518e8792").response { dataNews in
            
            if let data = dataNews.data {
                do {
                    let responseNews = try JSONDecoder().decode(ResponseNews.self, from: data)
                    success(responseNews)
                } catch let err as NSError {
                    error(err)
                }
            }
        }
    }
}
