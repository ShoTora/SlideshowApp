//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 川口彰太郎 on 2020/09/27.
//  Copyright © 2020 shotaro.kawaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var slideshowButton: UIButton!

    
    let img1 = UIImage(named: "Image1")
    let img2 = UIImage(named: "Image2")
    let img3 = UIImage(named: "Image3")
    
    var timer: Timer! // スライドショーに使用するタイマーを宣言
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = img1
    }

    @IBAction func goNext(_ sender: Any) {
        if imageView.image == img1 {
            imageView.image = img2
        } else if imageView.image == img2 {
            imageView.image = img3
        } else {
            imageView.image = img1
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        if imageView.image == img1 {
            imageView.image = img3
        } else if imageView.image == img2 {
            imageView.image = img1
        } else {
            imageView.image = img2
        }
    }
    
    @IBAction func slidshow(_ sender: Any) {
        if timer == nil {
            // 再生中の時の処理
            
            goButton.isEnabled = false
            backButton.isEnabled = false
           
            // タイマーをリセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goNext(_:)), userInfo: nil, repeats: true)
            self.slideshowButton.setTitle("スライドショー停止", for: .normal)
        } else {
            // 停止時の処理
            
            goButton.isEnabled = true
            backButton.isEnabled = true
            
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            self.slideshowButton.setTitle("スライドショー開始", for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            // 遷移先のImageViewControlerを取得
            let next = segue.destination as? ImageViewController
            // 遷移先の変数に値を渡す
            next?.tappedImage = self.imageView.image
        }
    }
    
    @IBAction func tapImage(_ sender: Any) {
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }

}

