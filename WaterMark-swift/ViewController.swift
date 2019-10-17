//
//  ViewController.swift
//  WaterMark-swift
//
//  Created by 明孔 on 2019/10/16.
//  Copyright © 2019 明孔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        
    }
    @IBAction func addWater(_ sender: Any) {
         self.imageView.addWaterText(text: "迪丽热巴", color: UIColor.orange, font: UIFont.systemFont(ofSize: 15))
    }
    
    @IBAction func removeWater(_ sender: Any) {
       self.imageView.removeTextLayer(water: "迪丽热巴")
    }
    
}

