//
//  ViewController.swift
//  JSON-Project
//
//  Created by Greeens5 on 06/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! TableViewCell
        cell.title.text = titles[indexPath.row]
        cell.iddeal.text = name[indexPath.row]
        let imgurl = URL(string: img [indexPath.row])
        let imgdata = try?Data(contentsOf: imgurl!)
        cell.caticon.image = UIImage(data: imgdata!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    var linkkey = "https://www.myprivatedeal.com/API/getDeals.php?key=jcjn79b8f043f4y74yh48ug984u"
    var name = [String] ()
    var titles = [String] ()
    var img = [String] ()
    var maplon = [String]()
    var maplat = [String]()
    var maptitle = [String]()
    override func viewDidLoad() {
        let url = URL(string: linkkey)
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
                                
                                self.name.append(path["id_deal"] as! String)
                                self.titles.append(path["title"] as! String)
                                self.img.append(path["cat_icon"] as! String)
                                self.maplat.append(path["latitude"] as! String)
                                self.maplon.append(path["longitude"] as! String)
                                self.maptitle.append(path["store_title"] as! String)
                            }
                        }
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                    }
                }catch let error as NSError{
                    print(error)
                }
            }
            }.resume()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "gotosecond", sender: self)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.globalstring = String(indexPath.row)
        appDelegate.globallatitude = String(maplat[indexPath.row])
        appDelegate.globallongitude = String(maplon[indexPath.row])
        appDelegate.globaltitle = maptitle[indexPath.row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

