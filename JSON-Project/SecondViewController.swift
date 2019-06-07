//
//  SecondViewController.swift
//  JSON-Project
//
//  Created by Greeens5 on 07/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet var collectonview: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! CollectionViewCell
        let imgurl = URL(string: photodata[indexPath.row])
        let imgdata = try?Data(contentsOf: imgurl!)
        cell.photos.image = UIImage(data: imgdata!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoimage", sender: self)
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.globalimage = photodata[indexPath.row]
         appDelegate.globallatitude = String(maplat[0])
         appDelegate.globallongitude = String(maplon[0])
    }
    var linkkey = "https://www.myprivatedeal.com/API/getDeals.php?key=jcjn79b8f043f4y74yh48ug984u"
    var photos = [NSArray] ()
    var photodata = [String]()
   let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var maplon = [String]()
     var maplat = [String]()
    override func viewDidLoad() {
        let url = URL(string: linkkey)
        let index = Int(appDelegate.globalstring!)
        URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if error != nil
            {
                print(error!)
            }else{
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                    {
                        
                        let myarray = json["Deal"] as! NSArray
                        for arr in myarray
                        {
                            if let path = arr as?[String: Any]
                            {
                               self.photos.append(path["photo"] as! NSArray)
                                 self.maplat.append(path["latitude"] as! String)
                                 self.maplon.append(path["longitude"] as! String)
                            }
                            
                        }
                        for data in self.photos[index!]
                        {
                            self.photodata.append(data as! String)
                        }
                        DispatchQueue.main.async {
                            self.collectonview.reloadData()
                        }
                    }
                }catch let error as NSError{
                    print(error)
                }
            }
            }.resume()}
//

    @IBAction func gotomap(_ sender: Any) {
        self.performSegue(withIdentifier: "gotomap", sender: self)
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
