//
//  UIView+Utils.h
//  DDStartRatingView
//
//  Created by lovelydd on 14/11/6.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Utils)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@end
