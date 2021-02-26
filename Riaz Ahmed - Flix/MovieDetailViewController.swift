//
//  MovieDetailViewController.swift
//  Riaz Ahmed - Flix
//
//  Created by RIAZ on 2/25/21.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backDrop: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synLable: UILabel!
    
    var movie : [String:Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synLable.text = movie["overview"] as? String
        synLable.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        
        let posterpath = movie["poster_path"] as! String
        
        let posterUrl = URL(string: baseUrl + posterpath)!
        
        posterView.af_setImage(withURL: posterUrl)

        
        //back drop
        
        let backdoppath = movie["backdrop_path"] as! String
        
        let backdopUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdoppath)!
        
        backDrop.af_setImage(withURL: backdopUrl)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
