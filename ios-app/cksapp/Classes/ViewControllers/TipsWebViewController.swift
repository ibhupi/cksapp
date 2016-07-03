//
//  TipsWebViewController.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/3/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class TipsWebViewController: BaseWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 全画面表示にする
        self.webView.frame = self.view.bounds
        
        // index.htmlのパスを取得する
        let path = NSBundle.mainBundle().pathForResource("Tips", ofType: "html", inDirectory: "component/feature")!
        let url = NSURL(string: path)!
        
        // リクエストを生成する
        let urlRequest = NSURLRequest(URL: url)
        
        // 指定したページを読み込む
        self.webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
