//
//  DDStartRatingView.h
//  DDStartRatingView
//
//  Created by lovelydd on 14/11/6.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDStartRatingView;
@protocol DDStartRatingViewDelegate <NSObject>

@optional;
-(void)starRatingView:(DDStartRatingView *)view touchIndex:(int)index;

@end

@interface DDStartRatingView : UIView

@property(nonatomic,assign)id<DDStartRatingViewDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame delegate:(id<DDStartRatingViewDelegate>) delegate;

- (void)updateCommitButtonTittle;
@end