//
//  InterfaceController.swift
//  HomeTemp WatchKit Extension
//
//  Created by Katsenos Christos on 8/2/20.
//  Copyright © 2020 Katsenos Christos. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var lblTemp: WKInterfaceLabel!
    @IBOutlet weak var lblHumidity: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
            print(1)
        lblTemp.setText("22")
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print(2)

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
