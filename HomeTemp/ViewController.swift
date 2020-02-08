//
//  ViewController.swift
//  HomeTemp
//
//  Created by Katsenos Christos on 8/2/20.
//  Copyright © 2020 Katsenos Christos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
       
        let tempURL : String = "http://192.168.2.20/temperature"
        let humidityURL : String = "http://192.168.2.20/humidity"
         
        self.lblTemp.text = hitAPI(_for: tempURL, method: "GET")
        self.lblHumidity.text = hitAPI(_for: humidityURL, method: "GET")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    func hitAPI(_for URLString:String, method:String) -> String {
       let configuration = URLSessionConfiguration.default
       let session = URLSession(configuration: configuration)
       let url = URL(string: URLString)
       //let url = NSURL(string: urlString as String)
       var request : URLRequest = URLRequest(url: url!)
       var responce : String = "00"
       request.httpMethod = method
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       request.addValue("application/json", forHTTPHeaderField: "Accept")
       let dataTask = session.dataTask(with: url!) { data,response,error in
          // 1: Check HTTP Response for successful GET request
          guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
          else {
             print("error: not a valid http response")
             return
          }
          switch (httpResponse.statusCode) {
             case 200:
                responce = String(bytes: receivedData, encoding: .utf8) ?? "00"
                print(responce)
             case 400:
                break
             default:
                break
          }
       }
        dataTask.resume()
        
        return responce
    }
    
    
}

