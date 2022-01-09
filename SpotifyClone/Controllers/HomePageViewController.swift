//
//  HomePageViewController.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/6/21.
//

import UIKit
import SDWebImage
import SwiftSoup

class HomePageViewController: UIViewController {
    
    
    private var recentlyPlayedTracks: RecentlyPlayedTracks?
    private var topArtists: UserTopItems?
    private var userProfile: UserProfile?
    private var collectionViewCellIndex: IndexPath = []
    private var collectionViewCellIndexPathRow: Int? = nil
    
   
    @IBOutlet weak var recentlyPlayedCollectionView: UICollectionView!
    @IBOutlet weak var topArtistCollectionView: UICollectionView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        
        
        gradient.locations = [-2, 0.7]
        return gradient
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        recentlyPlayedCollectionView.delegate = self
        recentlyPlayedCollectionView.dataSource = self
        topArtistCollectionView.delegate = self
        topArtistCollectionView.dataSource = self
        

        getUserProfile()
        getRecentlyPlayedTracks()
        getUserTopArtists()
//        let url = URL(string:"https://open.spotify.com/artist/4O15NlyKLIASxsJ0PrXPfz")!
//        do {
//            let html = try String(contentsOf: url)
//            let document = try SwiftSoup.parse(html)
//
//            //let description = try document.select("#config").first()!
//
//            //print(document)
//
//            //print(try document.select("script").attr("id").first)
//            print(try document.getElementsByAttributeValue("data-testid", "tracklist-row").first()?.text())
//        } catch {
//            print("error")
//        }
        
        
        updateBackgroundGradient()
        
        
        
    }
    
   
    
    private func updateBackgroundGradient() {
        DispatchQueue.main.async {
            
            //frame the gradient to background image view
            self.gradient.frame = self.backgroundImageView.bounds
            /*
            // get the dominant color of profile pic
            guard let color = image?.averageColor else {
                //if error getting color from the image, default the gradient to orange and black
                self.gradient.colors = [
                    UIColor.green.cgColor,
                    UIColor.black.cgColor
                ]
                
                //add gradient to image view
                self.backgroundImageView.layer.addSublayer(self.gradient)
                
                //animate the alpha back in
                UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                    self.backgroundImageView.alpha = 1
                }
                
                return
            }*/
            
            //set the gradiant colors to color and black
            self.gradient.colors = [
                UIColor.green.cgColor,
                UIColor.black.cgColor
            ]
            
            
            //add gradient to image view
            self.backgroundImageView.layer.addSublayer(self.gradient)
            
            //animate the alpha back in
            UIImageView.animate(withDuration: 0, delay: 0, options: .curveEaseOut) {
                self.backgroundImageView.alpha = 1
            }
            
        }
    }
    
    
    // MARK: API CALL FUNCTIONS
    private func getUserProfile() {
        APICaller.shared.getCurrentUserProfile { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    
                    self?.userProfile = model
                    self?.updateUI()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getUserTopArtists() {
        APICaller.shared.getCurrentUserTopItems { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    
                    self.topArtists = model
                    self.topArtistCollectionView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func getRecentlyPlayedTracks() {
        APICaller.shared.getRecentlyPlayedTracks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    
                    self?.recentlyPlayedTracks = model
                    self?.recentlyPlayedCollectionView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI() {
        
        guard let userProfile = userProfile else {
            return
        }
        
        welcomeLabel.text = "Welcome \(userProfile.display_name)"
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "previewTrack" {
            
            let trackURL = recentlyPlayedTracks?.items[collectionViewCellIndexPathRow!].track.preview_url
            let imageURL = recentlyPlayedTracks?.items[collectionViewCellIndexPathRow!].track.album.images[0].url
            
            let navController = segue.destination as! UINavigationController
            let trackPreviewViewController = navController.topViewController as! TrackPreviewViewController
            
            trackPreviewViewController.url = trackURL
            trackPreviewViewController.imageURL = imageURL
            
            
            
        }
    }
    

    

}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == recentlyPlayedCollectionView {
            return recentlyPlayedTracks?.items.count ?? 0
        } else {
            return topArtists?.items.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recentlyPlayedCollectionView.dequeueReusableCell(withReuseIdentifier: "recentlyPlayedCell", for: indexPath) as? RecentlyPlayedCollectionViewCell
        
        let topArtistCell = topArtistCollectionView.dequeueReusableCell(withReuseIdentifier: "topArtistCell", for: indexPath) as? TopArtistsCollectionViewCell
        
        
        if collectionView == recentlyPlayedCollectionView {
            
            guard let recentlyPlayedTracks = recentlyPlayedTracks else {
                return cell!
            }
            
            // RECENTLY PLAYED
            let trackName = recentlyPlayedTracks.items[indexPath.row].track.name
            let imageURL = recentlyPlayedTracks.items[indexPath.row].track.album.images[0].url
            
            cell?.recentlyPlayedName.text = trackName
            
            guard let url = URL(string: imageURL) else {
                return cell!
            }
            
            
            cell?.recentlyPlayedImage.sd_setImage(with: url, completed: nil)
            
            
            
            
            return cell!
            
        } else {
            
            
            
            guard let topArtists = topArtists else {
                return topArtistCell!
            }
            
            // TOP ARTISTS
            let artistName = topArtists.items[indexPath.row].name
            let topArtistImageURL = topArtists.items[indexPath.row].images[0].url
            
            topArtistCell?.topArtistLabel.text = artistName
            topArtistCell?.topArtistRank.text = "\(indexPath.row+1)."
            
            
            guard let topArtistImageURL = URL(string: topArtistImageURL) else {
                return topArtistCell!
            }
            
            topArtistCell?.topArtistImageView.sd_setImage(with: topArtistImageURL, completed: nil)
            topArtistCell?.topArtistImageView.layer.cornerRadius = 75
            topArtistCell?.topArtistImageView.layer.borderWidth = 1
            topArtistCell?.topArtistImageView.layer.borderColor = CGColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
            
            return topArtistCell!
 
            
        }
        
        //return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == recentlyPlayedCollectionView {
            let vc =  UIStoryboard(name: "TrackPreview", bundle: nil).instantiateViewController(withIdentifier: "trackPreview") as? TrackPreviewViewController
            
            guard let sb = vc else {return}
            sb.modalPresentationStyle = .fullScreen
            //sb.url = recentlyPlayedTracks?.items[indexPath.row].track.preview_url
        
            //navigationController?.pushViewController(sb, animated: true)
            collectionViewCellIndex = indexPath
            collectionViewCellIndexPathRow = collectionViewCellIndex.row
            performSegue(withIdentifier: "previewTrack", sender: self)
        }
        
        
    }
    
    
    
    
    
}
