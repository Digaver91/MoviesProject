//
//  ViewController.swift
//  cinemaCollectionView
//
//  Created by Dmytro Gavrylov on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
   
    
    var filmsArray = [Movies]()
    var movie: Movies?
    
    private var moviesPath = "https://j3gqy.mocklab.io/allMovies"
       
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadFromUrl()

    }


}
extension ViewController: UICollectionViewDelegate {
    
}
    
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? MainCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        cell.movie = filmsArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movies = filmsArray[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowMovieViewController") as? ShowMovieViewController else {return}
        
        let movie = filmsArray[indexPath.row]
        vc.movie = movie
        
        show(vc, sender: movies)
        
    }
    
    private func loadFromUrl() {
        guard let url = URL(string: moviesPath) else { return }
        let request = URLRequest(url: url)
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            let result = try? decoder.decode([Movies].self,from: data!)
            self.filmsArray = result!
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.resume()
    }
   
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    /// 1
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        /// 2
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    /// 3
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// 4
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        /// 5
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        /// 6
        return CGSize(width: widthPerItem - 8, height: 350)
    }
}

