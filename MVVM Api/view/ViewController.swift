//
//  ViewController.swift
//  MVVM Api
//
//  Created by Yusmi Putra on 7/27/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewNews: UITableView!
    private var viewModel : NewsViewModel!
    var listArtikel: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = NewsViewModel()
        viewModel.getNews()
        onObserver()
        // Do any additional setup after loading the view.
    }
    
    private func onObserver() {
        viewModel.responseNews.bind {
            dataNews in
            if let article = dataNews?.articles {
                self.listArtikel = article
                self.tableViewNews.reloadData()
                print(article)
            }
        }
        
        viewModel.error.bind { error in
            print("error network \(error)")
        }
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArtikel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewNews.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        let data = listArtikel[indexPath.row]
        cell.judulNews.text = data.title
        cell.imageNews.sd_setImage(with: URL(string: "\(data.urlToImage ?? "")"))
        return cell
    }
}

