//
//  ImageEnlargeViewController.swift
//  JSON-Project
//
//  Created by Greeens5 on 07/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ImageEnlargeViewController: UIViewController {

    @IBOutlet var imageview: UIImageView!
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgurl = URL(string: (appDelegate.globalimage!))
        let imgdata = try?Data(contentsOf: imgurl!)
        imageview.image = UIImage(data: imgdata!)
        // Do any additional setup after loading the view.
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
