//
//  MBProgressHUDExtension.swift
//  PointsMall
//
//  Created by 张飞 on 16/6/20.
//  Copyright © 2016年 张飞. All rights reserved.
//

import Foundation
import UIKit

extension MBProgressHUD{
    class func showText(_ text:String) {
        MBProgressHUD.showText(text, toView: nil)
    }
    class func showText(_ text:String, toView:UIView? ){
        if text == "" {
            return
        }
        var view = toView
        if view == nil {
            view = UIApplication.shared.windows.last
        }
        var hud = MBProgressHUD.HUDForView(view!)
        if hud == nil {
            hud = MBProgressHUD.showHUDAddedTo(view!, animated: true)
        }
        // Configure for text only and offset down
        hud!.mode = .text
        hud!.labelText = text
//        hud.margin = 10.0 //默认20  改为10会变窄
        hud!.removeFromSuperViewOnHide = true
        
        hud!.hide(true, afterDelay: 1)
    }
    class func showWait(_ message:String?)->MBProgressHUD{
        let view = UIApplication.shared.windows.last
        let hud: MBProgressHUD = MBProgressHUD.showHUDAddedTo(view!, animated: true)
        hud.labelText = message
        hud.removeFromSuperViewOnHide = true
        hud.show(true)
        return hud
    }
    class func showWait()->MBProgressHUD{
        return MBProgressHUD.showWait(nil)
    }
    class func hideHUDForView(_ forView:UIView?){
        var view = forView
        if view == nil {
            view = UIApplication.shared.windows.last
        }
        _ = self.hideHUDForView(view!, animated: true)
    }
    class func hideHUD(){
        MBProgressHUD.hideHUDForView(nil)
    }
}
