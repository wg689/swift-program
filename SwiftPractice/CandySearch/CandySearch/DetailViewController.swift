//
//  DetailViewController.swift
//  CandySearch
//
//  Created by  汪刚 on 2018/9/16.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var detailCandy: Candy?{
        didSet{
            configView()
        }
        
    }
    
    func configView(){
        if let detailCandy = detailCandy{
            if let lable = lable,let image = image {
                lable.text = detailCandy.name
                image.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
