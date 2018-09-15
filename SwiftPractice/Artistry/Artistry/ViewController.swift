//
//  ViewController.swift
//  Artistry
//
//  Created by  汪刚 on 2018/9/15.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let artists = Artist.artistsFromBundle()
    
    @IBOutlet weak var tabeleView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabeleView.rowHeight = 120 ;//UITableViewAutomaticDimension
        tabeleView.estimatedRowHeight = 120
        
        
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tabeleView.reloadData()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detination = segue.destination as? DetailViewController{
            let indexpath = tabeleView.indexPathForSelectedRow
            detination.selectArtist = artists[(indexpath?.row)!]
        }
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! MainTableViewCell
        let artist = artists[indexPath.row]
        cell.lable1.text = artist.bio
        cell.lable2.text = artist.name
        
        cell.headImage.image = artist.image;
        return cell
    }
}
