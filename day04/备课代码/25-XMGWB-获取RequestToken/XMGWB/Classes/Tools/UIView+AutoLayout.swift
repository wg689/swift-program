//
//  UIView+AutoLayout.swift
//  XMGWeibo
//
//  Created by 李南江 on 15/9/1.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
/**
    对齐类型枚举，设置控件相对于父视图的位置
  - TopLeft:      左上
  - TopRight:     右上
  - TopCenter:    中上
  - BottomLeft:   左下
  - BottomRight:  右下
  - BottomCenter: 中下
  - CenterLeft:   左中
  - CenterRight:  右中
  - Center: 中中
*/
public enum XMG_AlignType {
    case TopLeft
    case TopRight
    case TopCenter
    case BottomLeft
    case BottomRight
    case BottomCenter
    case CenterLeft
    case CenterRight
    case Center
    
    private func layoutAttributes(isInner: Bool, isVertical: Bool) -> XMG_LayoutAttributes {
        let attributes = XMG_LayoutAttributes()
        
        switch self {
            case .TopLeft:
                attributes.horizontals(.Left, to: .Left).verticals(.Top, to: .Top)
                
                if isInner {
                    return attributes
                } else if isVertical {
                    return attributes.verticals(.Bottom, to: .Top)
                } else {
                    return attributes.horizontals(.Right, to: .Left)
                }
            case .TopRight:
                attributes.horizontals(.Right, to: .Right).verticals(.Top, to: .Top)
                
                if isInner {
                    return attributes
                } else if isVertical {
                    return attributes.verticals(.Bottom, to: .Top)
                } else {
                    return attributes.horizontals(.Left, to: .Right)
                }
            case .BottomLeft:
                attributes.horizontals(.Left, to: .Left).verticals(.Bottom, to: .Bottom)
                
                if isInner {
                    return attributes
                } else if isVertical {
                    return attributes.verticals(.Top, to: .Bottom)
                } else {
                    return attributes.horizontals(.Right, to: .Left)
                }
            case .BottomRight:
                attributes.horizontals(.Right, to: .Right).verticals(.Bottom, to: .Bottom)
                
                if isInner {
                    return attributes
                } else if isVertical {
                    return attributes.verticals(.Top, to: .Bottom)
                } else {
                    return attributes.horizontals(.Left, to: .Right)
                }
            // 仅内部 & 垂直参照需要
            case .TopCenter:
                attributes.horizontals(.CenterX, to: .CenterX).verticals(.Top, to: .Top)
                return isInner ? attributes : attributes.verticals(.Bottom, to: .Top)
            // 仅内部 & 垂直参照需要
            case .BottomCenter:
                attributes.horizontals(.CenterX, to: .CenterX).verticals(.Bottom, to: .Bottom)
                return isInner ? attributes : attributes.verticals(.Top, to: .Bottom)
            // 仅内部 & 水平参照需要
            case .CenterLeft:
                attributes.horizontals(.Left, to: .Left).verticals(.CenterY, to: .CenterY)
                return isInner ? attributes : attributes.horizontals(.Right, to: .Left)
            // 仅内部 & 水平参照需要
            case .CenterRight:
                attributes.horizontals(.Right, to: .Right).verticals(.CenterY, to: .CenterY)
                return isInner ? attributes : attributes.horizontals(.Left, to: .Right)
            // 仅内部参照需要
            case .Center:
                return XMG_LayoutAttributes(horizontal: .CenterX, referHorizontal: .CenterX, vertical: .CenterY, referVertical: .CenterY)
        }
    }
}

extension UIView {
    

    /**
    填充子视图
    
    :param: referView 参考视图
    :param: insets    间距
    
    :returns: 约束数组
    */
    public func xmg_Fill(referView: UIView, insets: UIEdgeInsets = UIEdgeInsetsZero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var cons = [NSLayoutConstraint]()
        
        cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(insets.left)-[subView]-\(insets.right)-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : self])
        cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-\(insets.top)-[subView]-\(insets.bottom)-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["subView" : self])
        
        superview?.addConstraints(cons)
        
        return cons
    }

    /**
    参照参考视图内部对齐
    
    :param: type      对齐方式
    :param: referView 参考视图
    :param: size      视图大小，如果是 nil 则不设置大小
    :param: offset    偏移量，默认是 CGPoint(x: 0, y: 0)
    
    :returns: 约束数组
    */
    public func xmg_AlignInner(type type: XMG_AlignType, referView: UIView, size: CGSize?, offset: CGPoint = CGPointZero) -> [NSLayoutConstraint]  {
        
        return xmg_AlignLayout(referView, attributes: type.layoutAttributes(true, isVertical: true), size: size, offset: offset)
    }

    /**
    参照参考视图垂直对齐
    
    :param: type      对齐方式
    :param: referView 参考视图
    :param: size      视图大小，如果是 nil 则不设置大小
    :param: offset    偏移量，默认是 CGPoint(x: 0, y: 0)
    
    :returns: 约束数组
    */
    public func xmg_AlignVertical(type type: XMG_AlignType, referView: UIView, size: CGSize?, offset: CGPoint = CGPointZero) -> [NSLayoutConstraint] {
        
        return xmg_AlignLayout(referView, attributes: type.layoutAttributes(false, isVertical: true), size: size, offset: offset)
    }
    
    /**
    参照参考视图水平对齐
    
    :param: type      对齐方式
    :param: referView 参考视图
    :param: size      视图大小，如果是 nil 则不设置大小
    :param: offset    偏移量，默认是 CGPoint(x: 0, y: 0)
    
    :returns: 约束数组
    */
    public func xmg_AlignHorizontal(type type: XMG_AlignType, referView: UIView, size: CGSize?, offset: CGPoint = CGPointZero) -> [NSLayoutConstraint] {
        
        return xmg_AlignLayout(referView, attributes: type.layoutAttributes(false, isVertical: false), size: size, offset: offset)
    }

    /**
    在当前视图内部水平平铺控件
    
    :param: views  子视图数组
    :param: insets 间距
    
    :returns: 约束数组
    */
    public func xmg_HorizontalTile(views: [UIView], insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        assert(!views.isEmpty, "views should not be empty")
        
        var cons = [NSLayoutConstraint]()
        
        let firstView = views[0]
        firstView.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self, size: nil, offset: CGPoint(x: insets.left, y: insets.top))
        cons.append(NSLayoutConstraint(item: firstView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -insets.bottom))
        
        // 添加后续视图的约束
        var preView = firstView
        for i in 1..<views.count {
            let subView = views[i]
            cons += subView.xmg_sizeConstraints(firstView)
            subView.xmg_AlignHorizontal(type: XMG_AlignType.TopRight, referView: preView, size: nil, offset: CGPoint(x: insets.right, y: 0))
            preView = subView
        }
        
        let lastView = views.last!
        cons.append(NSLayoutConstraint(item: lastView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -insets.right))
        
        addConstraints(cons)
        return cons
    }

    /**
    在当前视图内部垂直平铺控件
    
    :param: views  子视图数组
    :param: insets 间距
    
    :returns: 约束数组
    */
    public func xmg_VerticalTile(views: [UIView], insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        assert(!views.isEmpty, "views should not be empty")
        
        var cons = [NSLayoutConstraint]()
        
        let firstView = views[0]
        firstView.xmg_AlignInner(type: XMG_AlignType.TopLeft, referView: self, size: nil, offset: CGPoint(x: insets.left, y: insets.top))
        cons.append(NSLayoutConstraint(item: firstView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -insets.right))
        
        // 添加后续视图的约束
        var preView = firstView
        for i in 1..<views.count {
            let subView = views[i]
            cons += subView.xmg_sizeConstraints(firstView)
            subView.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: preView, size: nil, offset: CGPoint(x: 0, y: insets.bottom))
            preView = subView
        }
        
        let lastView = views.last!
        cons.append(NSLayoutConstraint(item: lastView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -insets.bottom))
        
        addConstraints(cons)
        
        return cons
    }

    /**
    从约束数组中查找指定 attribute 的约束
    
    :param: constraintsList 约束数组
    :param: attribute       约束属性
    
    :returns: 对应的约束
    */
    public func xmg_Constraint(constraintsList: [NSLayoutConstraint], attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        for constraint in constraintsList {
            if constraint.firstItem as! NSObject == self && constraint.firstAttribute == attribute {
                return constraint
            }
        }
        
        return nil
    }
    
    // MARK: - 私有函数
    /**
    参照参考视图对齐布局
    
    :param: referView  参考视图
    :param: attributes 参照属性
    :param: size       视图大小，如果是 nil 则不设置大小
    :param: offset     偏移量，默认是 CGPoint(x: 0, y: 0)
    
    :returns: 约束数组
    */
    private func xmg_AlignLayout(referView: UIView, attributes: XMG_LayoutAttributes, size: CGSize?, offset: CGPoint) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var cons = [NSLayoutConstraint]()
        
        cons += xmg_positionConstraints(referView, attributes: attributes, offset: offset)
        
        if size != nil {
            cons += xmg_sizeConstraints(size!)
        }
        
        superview?.addConstraints(cons)
        
        return cons
    }
    

    /**
    尺寸约束数组
    
    :param: size 视图大小
    
    :returns: 约束数组
    */
    private func xmg_sizeConstraints(size: CGSize) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        
        cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: size.width))
        cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: size.height))
        
        return cons
    }
    

    /**
    尺寸约束数组
    
    :param: referView 参考视图，与参考视图大小一致
    
    :returns: 约束数组
    */
    private func xmg_sizeConstraints(referView: UIView) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        
        cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        cons.append(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))
        
        return cons
    }
    
    /**
    位置约束数组
    
    :param: referView  参考视图
    :param: attributes 参照属性
    :param: offset     偏移量
    
    :returns: 约束数组
    */
    private func xmg_positionConstraints(referView: UIView, attributes: XMG_LayoutAttributes, offset: CGPoint) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        
        cons.append(NSLayoutConstraint(item: self, attribute: attributes.horizontal, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: attributes.referHorizontal, multiplier: 1.0, constant: offset.x))
        cons.append(NSLayoutConstraint(item: self, attribute: attributes.vertical, relatedBy: NSLayoutRelation.Equal, toItem: referView, attribute: attributes.referVertical, multiplier: 1.0, constant: offset.y))
        
        return cons
    }
}

///  布局属性
private final class XMG_LayoutAttributes {
    var horizontal:         NSLayoutAttribute
    var referHorizontal:    NSLayoutAttribute
    var vertical:           NSLayoutAttribute
    var referVertical:      NSLayoutAttribute
    
    init() {
        horizontal = NSLayoutAttribute.Left
        referHorizontal = NSLayoutAttribute.Left
        vertical = NSLayoutAttribute.Top
        referVertical = NSLayoutAttribute.Top
    }
    
    init(horizontal: NSLayoutAttribute, referHorizontal: NSLayoutAttribute, vertical: NSLayoutAttribute, referVertical: NSLayoutAttribute) {
        
        self.horizontal = horizontal
        self.referHorizontal = referHorizontal
        self.vertical = vertical
        self.referVertical = referVertical
    }
    
    private func horizontals(from: NSLayoutAttribute, to: NSLayoutAttribute) -> Self {
        horizontal = from
        referHorizontal = to
        
        return self
    }
    
    private func verticals(from: NSLayoutAttribute, to: NSLayoutAttribute) -> Self {
        vertical = from
        referVertical = to
        
        return self
    }
}