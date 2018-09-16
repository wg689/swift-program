//
//  DetailViewController.swift
//  Artistry
//
//  Created by  汪刚 on 2018/9/15.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView1: UITableView!
    
    var selectArtist: Artist!
    let moreInfoText = "Select For More Info >"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectArtist.name
        tableView1.rowHeight = UITableViewAutomaticDimension
        tableView1.estimatedRowHeight = 300
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView1 .reloadData()
        }

    }

}

extension DetailViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetaiTableViewCell", for: indexPath)as! DetaiTableViewCell
        let work = selectArtist.works[indexPath.row]
        cell.lable?.text = work.title
        cell.image1?.image = work.image
        cell.textView1.text = work.isExpanded ? work.info  :moreInfoText;
        
        return cell
        
    }
    
}
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? DetaiTableViewCell else {
            return
        }
        
        var work = selectArtist.works[indexPath.row]
        
        work.isExpanded = !work.isExpanded
        selectArtist.works[indexPath.row] = work
        
        cell.textView1.text = work.isExpanded ? work.info : moreInfoText
        cell.textView1.textAlignment = work.isExpanded ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

