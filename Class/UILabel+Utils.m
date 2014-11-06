//
//  UILabel+Utils.m
//  DDStartRatingView
//
//  Created by lovelydd on 14/11/6.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "UILabel+Utils.h"

@implementation UILabel (Utils)


@dynamic autoResize;
-(void)setAutoResize:(BOOL)autoResize{
    if (autoResize == YES) {
        [self setNumberOfLines:0];
        CGSize size = CGSizeMake(self.frame.size.width,MAXFLOAT);
        CGSize labelsize = [self.text sizeWithFont:self.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        if (labelsize.height>self.frame.size.height) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, labelsize.height);
        }
        
    }
    
}
@end