//
//  StepperStyleKit.swift
//  AudioKitSynthOne
//
//  Created by Matthew Fecher on 10/20/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class StepperStyleKit : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawStepper(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 109, height: 37), resizing: ResizingBehavior = .aspectFit, valuePressed: CGFloat = 0, text: String = "1") {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 109, height: 37), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 109, y: resizedFrame.height / 37)


        //// Color Declarations
        let selectedColor = UIColor(red: 0.369, green: 0.369, blue: 0.388, alpha: 1.000)
        let offColor = UIColor(red: 0.243, green: 0.243, blue: 0.263, alpha: 1.000)
        let btnBack = UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 1.000)
        let textColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1.000)

        //// Variable Declarations
        let downSeleted = valuePressed == 1 ? selectedColor : offColor
        let upSelected = valuePressed == 2 ? selectedColor : offColor

        //// Button
        //// btnMinus Drawing
        let btnMinusPath = UIBezierPath(roundedRect: CGRect(x: 0.5, y: 2, width: 35, height: 31), cornerRadius: 1)
        downSeleted.setFill()
        btnMinusPath.fill()
        UIColor.black.setStroke()
        btnMinusPath.lineWidth = 1
        btnMinusPath.stroke()


        //// btnPlus Drawing
        let btnPlusPath = UIBezierPath(roundedRect: CGRect(x: 70.5, y: 2, width: 35, height: 31), cornerRadius: 1)
        upSelected.setFill()
        btnPlusPath.fill()
        UIColor.black.setStroke()
        btnPlusPath.lineWidth = 1
        btnPlusPath.stroke()


        //// background Drawing
        let backgroundRect = CGRect(x: 35.5, y: 2, width: 35, height: 31)
        let backgroundPath = UIBezierPath(roundedRect: backgroundRect, cornerRadius: 1)
        btnBack.setFill()
        backgroundPath.fill()
        UIColor.black.setStroke()
        backgroundPath.lineWidth = 1
        backgroundPath.stroke()
        let backgroundStyle = NSMutableParagraphStyle()
        backgroundStyle.alignment = .center
        let backgroundFontAttributes = [
            NSFontAttributeName: UIFont(name: "AvenirNextCondensed-Regular", size: UIFont.systemFontSize)!,
            NSForegroundColorAttributeName: textColor,
            NSParagraphStyleAttributeName: backgroundStyle,
        ]

        let backgroundTextHeight: CGFloat = text.boundingRect(with: CGSize(width: backgroundRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: backgroundFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: backgroundRect)
        text.draw(in: CGRect(x: backgroundRect.minX, y: backgroundRect.minY + (backgroundRect.height - backgroundTextHeight) / 2, width: backgroundRect.width, height: backgroundTextHeight), withAttributes: backgroundFontAttributes)
        context.restoreGState()


        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: 89.5, y: 17.5)
        context.rotate(by: -180 * CGFloat.pi/180)

        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 3.5, y: -5.33))
        rectanglePath.addLine(to: CGPoint(x: -3.5, y: -0))
        rectanglePath.addLine(to: CGPoint(x: 3.5, y: 5.33))
        textColor.setFill()
        rectanglePath.fill()

        context.restoreGState()


        //// Rectangle 4 Drawing
        context.saveGState()
        context.translateBy(x: 17, y: 17.5)

        let rectangle4Path = UIBezierPath()
        rectangle4Path.move(to: CGPoint(x: 3.5, y: -5.33))
        rectangle4Path.addLine(to: CGPoint(x: -3.5, y: 0))
        rectangle4Path.addLine(to: CGPoint(x: 3.5, y: 5.33))
        textColor.setFill()
        rectangle4Path.fill()

        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(StepperStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
