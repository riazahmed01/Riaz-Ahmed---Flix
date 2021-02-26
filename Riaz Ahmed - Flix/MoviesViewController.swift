//
//  MoviesViewController.swift
//  Riaz Ahmed - Flix
//
//  Created by RIAZ on 2/18/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        

    //outlets
    
    @IBOutlet weak var moviesTableView: UITableView!
    

    var movies = [[String:Any]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

              // TODO: Get the array of movies
            
            self.movies = dataDictionary["results"] as! [[String:Any]]
            self.moviesTableView.reloadData()
            
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! movieCell
        
        let movie = movies[indexPath.row]
        
        let title = movie["title"] as! String
        
        cell.titlelable.text = title
        
        let synopsis = movie["overview"] as! String
        
        cell.synlable.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        
        let posterpath = movie["poster_path"] as! String
        
        let posterUrl = URL(string: baseUrl + posterpath)!
        
        cell.posterimg.af_setImage(withURL: posterUrl)
        
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //find selected movie
        let cell = sender as! UITableViewCell
        let indexPath = moviesTableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        //show details
        let detailsViewController = segue.destination as! MovieDetailViewController
        detailsViewController.movie = movie
        
        //unselect
        moviesTableView.deselectRow(at: indexPath, animated: true)
    
    }
}
