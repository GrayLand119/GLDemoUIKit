//
//  GLMacro.swift
//  GLDemoUIKit
//
//  Created by GrayLand on 2020/3/30.
//  Copyright © 2020 GrayLand119. All rights reserved.
//

import UIKit

let GLDelegateWindow    = UIApplication.shared.delegate?.window
let GLKeyWindow         = UIApplication.shared.keyWindow

let CURRENT_APP_VERSION: String = Bundle.main.localizedInfoDictionary?["CFBundleShortVersionString"] as! String
let CURRENT_APP_NAME: String = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as! String

let SCREEN_WIDTH     = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT    = UIScreen.main.bounds.size.height
let PORTRAIT_WIDTH   = (SCREEN_WIDTH<SCREEN_HEIGHT ? SCREEN_WIDTH :SCREEN_HEIGHT)
let PORTRAIT_HEIGHT  = (SCREEN_WIDTH<SCREEN_HEIGHT ? SCREEN_HEIGHT :SCREEN_WIDTH)
let LANDSCAPE_WIDTH  = (PORTRAIT_HEIGHT)
let LANDSCAPE_HEIGHT = (PORTRAIT_WIDTH)

// 以iphone6为标准, 自动按比例放大和缩小
func SCALE_WIDTH(_ pt: CGFloat) -> CGFloat { return (pt)/375.0 * SCREEN_WIDTH }
func SCALE_HEIGHT(_ pt: CGFloat) -> CGFloat { return (pt)/667.0 * SCREEN_HEIGHT }
func SCALE_WIDTH_LANSCAPE(_ pt: CGFloat) -> CGFloat { return (pt)/375.0 * SCREEN_HEIGHT }
func SCALE_HEIGHT_LANSCAPE(_ pt: CGFloat) -> CGFloat { return (pt)/667.0 * SCREEN_WIDTH }
// 只放大, 不缩小
func SCALE_WIDTH_ZOOM_IN_ONLY(_ pt: CGFloat) -> CGFloat { return (SCREEN_WIDTH>375 ? SCALE_WIDTH(pt) : pt) }
func SCALE_HEIGHT_ZOOM_IN_ONLY(_ pt: CGFloat)  -> CGFloat { return (SCREEN_WIDTH>375 ? SCALE_HEIGHT(pt) : pt) }
// 只缩小, 不放大
func SCALE_WIDTH_ZOOM_OUT_ONLY(_ pt: CGFloat) -> CGFloat { return (SCREEN_WIDTH<375 ? SCALE_WIDTH(pt) : pt) }
func SCALE_HEIGHT_ZOOM_OUT_ONLY(_ pt: CGFloat)  -> CGFloat { return (SCREEN_WIDTH<375 ? SCALE_HEIGHT(pt) : pt) }

func ADD_BTN_TOUCHUP_INSIDE(_ btn: UIButton, observer: Any, sel: Selector) {
    btn.addTarget(observer, action: sel, for: UIControl.Event.touchUpInside)
}

func GL_RGB(_ r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
}
func GL_RGBA(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r, green: g, blue: b, alpha: a)
}

/*===============================================================
 Create the bridging file with name $PROJECT_NAME-Bridging-Header
 e.g.
 GLDemoUIKit-Bridging-Header.h
 
 //:configuration = Debug
 SWIFT_OBJC_BRIDGING_HEADER = GLDemoUIKit/GLDemoUIKit/Global/GLDemoUIKit-Bridging-Header.h

 //:configuration = Release
 SWIFT_OBJC_BRIDGING_HEADER = GLDemoUIKit/GLDemoUIKit/Global/GLDemoUIKit-Bridging-Header.h

 //:completeSettings = some
 SWIFT_OBJC_BRIDGING_HEADER
 
 #import "GLDependencyHeader.h"
 ===============================================================*/
func COLOR_WITH_HEX(_ hex: String) -> UIColor {
    return UIColor(hexString: hex) ?? UIColor.white
}

func IMAGE_WITH_COLOR(_ color: UIColor) -> UIImage? {
    return UIImage.init(color: color, size: CGSize(width: 1, height: 1))
}

func DLog(_ item: Any) {
    #if DEBUG
    print(item)
    #endif
}

func DDLog(_ item: Any) {
    #if DEBUG
    let file = (#file as NSString).lastPathComponent;
    let funcName =  #function;
    print("\(file):\(funcName)", item);
    #endif
}

let IS_FRINGE_SCREEN: Bool = {
    if #available(iOS 11.0, *) {
        return (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) > 0.0 ? true : false
    }else{
        return false
    }
}()

let STATUS_BAR_HEIGHT: CGFloat = {
    return IS_FRINGE_SCREEN ? 44.0 : 20.0
}()

let STATUS_BAR_REAL_HEIGHT: CGFloat = {
    return UIApplication.shared.statusBarFrame.size.height
}()

var NAVIGATION_BAR_HEIGHT: CGFloat = 44.0
var STATUS_AND_NAVIGATION_HEIGHT = STATUS_BAR_REAL_HEIGHT + NAVIGATION_BAR_HEIGHT
let GL_EMPTY_PLACEHOLDER = "- -"
let GL_EMPTY_PLACEHOLDER_SHORT = "--"

func GL_INJECTION() {
    #if DEBUG
    guard #available(iOS 9, *) else {return}
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
    #endif
}

typealias GLVoidCompletion = () -> () //或者 () -> Void
