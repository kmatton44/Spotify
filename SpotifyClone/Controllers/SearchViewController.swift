//
//  SearchViewController.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/16/21.
//

import UIKit
import SDWebImage

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    private var searchItems: SearchItems?
    private var queryText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchTextField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingChanged)
        

    }
    
    
    private func searchQuery(query: String) {

        APICaller.shared.searchItems(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print(model)
                    self?.searchItems = model
                    self?.tableView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let queryText = searchTextField.text else {
            return
        }
        
        if searchTextField.text != "" {
            let fixedQuery = queryText.replacingOccurrences(of: " ", with: "%20")
            
            searchQuery(query: fixedQuery)
        }
        else {
            searchItems = nil
            tableView.reloadData()
        }
       
        
        
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchItems?.artists.items.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell
        
        
//        let imageURL = recentlyPlayedTracks.items[indexPath.row].track.album.images[0].url
//
        
        
        
        
        
        cell?.searchTableLabel.text = searchItems?.artists.items[indexPath.row].name
        
        
        guard let imageURL = searchItems?.artists.items[indexPath.row].images.first?.url, let url = URL(string: imageURL ?? "") else {
            return cell!
        }
        cell?.searchTableImage.sd_setImage(with: url, completed: nil)
        
        
        
        //cell?.searchTableImage.sd_setImage(with: url, placeholderImage: UIImage(named: "person.fill"),  completed: nil)
        
        return cell!
    }
    
    
}
