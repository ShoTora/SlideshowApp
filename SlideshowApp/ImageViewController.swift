//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 川口彰太郎 on 2020/09/27.
//  Copyright © 2020 shotaro.kawaguchi. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    
    var tappedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bigImageView.image = tappedImage
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
