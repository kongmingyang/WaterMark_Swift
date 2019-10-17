//
//  WaterMart.swift
//  WaterMark-swift
//
//  Created by 明孔 on 2019/10/17.
//  Copyright © 2019 明孔. All rights reserved.
//

import UIKit

extension UIView {
    func addWaterText(text:NSString,color:UIColor,font:UIFont) {
            let waterText:String = text as String
            
            let textSize:CGSize = waterText.sizeWithText(font: UIFont.systemFont(ofSize: 15))
            let height = UIScreen.main.bounds.size.height
            let line:NSInteger = Int(height*3.5)%80
            let row:NSInteger = 20
            let lineSpace:Int = Int(textSize.width + 30)
            let rowHeight:Int = Int(textSize.width+40)
            let textWidth:Int = Int(textSize.width)
            let textHeight:Int = Int(textSize.height)
            for i in  0...line {
                for j in 0...row
                {
                    let textLayer = CATextLayer.init()
                    textLayer.contentsScale = UIScreen.main.scale
                    textLayer.font = font
                    textLayer.fontSize = font.pointSize
                    textLayer.foregroundColor = color.cgColor
                    textLayer.string = waterText
                    let hSpace : Int = j*lineSpace
                    let vSpace : Int = i * rowHeight
                    
                    textLayer.frame = CGRect(x: hSpace, y: vSpace, width: textWidth , height: textHeight)
                 
                    textLayer.transform = CATransform3DMakeRotation(CGFloat(-Double.pi / 16), 0, 0, 3)
                    self.layer.addSublayer(textLayer)
                }
            }
        }
    func removeTextLayer(water:String)  {
        let layers = self.layer.sublayers
        var sublayers = [CALayer]()
        
        for (idx,layer) in (layers?.enumerated())! {
            
            if layer .isKind(of: CATextLayer.self) {
                let textLayer = layer as!CATextLayer
                
                let waterText:String = textLayer.string as! String
                
                guard water == waterText else {
                    return
                }
                
            }else{
                sublayers.append(layer)
            }
           
            
            print(layer.frame,idx)
        }
        self.layer.sublayers = sublayers
        
        
    }
}
extension String{
func sizeWithText(font: UIFont) -> CGSize {
    let attributes = [NSAttributedString.Key.font: font]
    let option = NSStringDrawingOptions.usesLineFragmentOrigin
    let rect:CGRect = self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: option, attributes: attributes, context: nil)
        return rect.size;
    }

}
