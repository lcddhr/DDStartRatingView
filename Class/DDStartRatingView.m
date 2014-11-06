//
//  DDStartRatingView.m
//  DDStartRatingView
//
//  Created by lovelydd on 14/11/6.
//  Copyright (c) 2014年 lovelydd. All rights reserved.
//

#import "DDStartRatingView.h"
#import "UIView+Utils.h"
#import "UILabel+Utils.h"


#define kSystemHintMessage  @"【系统提示】客服已结束本次会话,请您为本次服务打分:"

static CGFloat const kSystemHintHeight          = 30.0f;
static CGFloat const kSystemHintHeightPadding   = 10.0f;
static CGFloat const kSystemHintLeftPadding     = 10.0f;

static CGFloat const kStartImageWidth   = 50.0f;
static CGFloat const kStartImageHeight  = 48.0f;

static CGFloat const kStartRatingViewHeight = 70.0f;

static CGFloat const kStartTitleHeight = 15.0f;


@interface DDStartRatingView()<DDStartRatingViewDelegate>
{
    UILabel *systemHint;
    UIButton *commitBtn;
    int touchIndex;
    
}

@property(nonatomic,retain)UIView *foregroundView;
@property(nonatomic,retain)UIView *backgroundView;
@end

@implementation DDStartRatingView



-(instancetype)initWithFrame:(CGRect)frame delegate:(id<DDStartRatingViewDelegate>) delegate
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = delegate;
        [self initView];
    }
    return self;
}

-(void)initView
{
    [self configureDefault];
    [self createSystemHintTitle];
    [self createStartRatingView];
    [self createCommitButton];
    
}

- (void)configureDefault
{
    self.backgroundColor = [UIColor grayColor];
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.8f;
    self.layer.cornerRadius = 2.5f;
    
    touchIndex = 5; //默认是5,表示非常满意
}

- (void)createSystemHintTitle
{
    systemHint = [[UILabel alloc] init];
    systemHint.frame = CGRectMake(kSystemHintLeftPadding, kSystemHintHeightPadding, self.width - 10 * 2 , kSystemHintHeight);
    systemHint.font = [UIFont systemFontOfSize:14.0f];
    systemHint.text = kSystemHintMessage;
    systemHint.autoResize = YES;
    [self addSubview:systemHint];
}

- (void)createStartRatingView
{
    _backgroundView =  [self startRatingView:@"backgroundStar.png"];
    _foregroundView =  [self startRatingView:@"foregroundStar.png"];
}

- (UIView *)startRatingView:(NSString *)imageName;
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(systemHint.left, systemHint.bottom, self.width - systemHint.left * 2, kStartRatingViewHeight)];
    view.clipsToBounds = YES;
    [self addSubview:view];
    
    NSArray *titleArray = @[@"恶劣",@"较差",@"一般",@"较好",@"非常满意"];
    for (int i = 0; i < 5; i++) {
        UIImageView *startImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * view.width / 5, 0, kStartImageWidth, kStartImageHeight)];
        startImageView.contentMode = UIViewContentModeScaleAspectFill;
        startImageView.image = [UIImage imageNamed:imageName];
        [view addSubview:startImageView];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(startImageView.left, startImageView.bottom, kStartImageWidth, kStartTitleHeight)];
        title.text = titleArray[i];
        title.font = [UIFont fontWithName:@"Helvetica" size:12.0f];
        title.textAlignment = NSTextAlignmentCenter ;
        [view addSubview:title];
    }
    return view;
}
- (void)createCommitButton
{
    commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(0, 0, 70, 30);
    commitBtn.center =CGPointMake(self.width / 2, self.backgroundView.bottom +20);
    commitBtn.layer.borderColor = [UIColor blackColor].CGColor;
    commitBtn.layer.borderWidth = 1.0f;
    commitBtn.layer.cornerRadius = 3.5f;
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:commitBtn];
    
}

#pragma mark -
#pragma mark - Button Action
- (void)commitAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(starRatingView:touchIndex:)]) {
        
        [self.delegate starRatingView:self touchIndex:touchIndex];
    }
}

- (void)updateCommitButtonTittle
{
    commitBtn.userInteractionEnabled = NO;
    [commitBtn setTitle:@"已提交" forState:UIControlStateNormal];
    commitBtn.layer.borderColor = [UIColor whiteColor].CGColor;
}


#pragma mark -
#pragma mark - Touche Event
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self touchesConfigure:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesConfigure:touches];
}

- (void)touchesConfigure:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:_backgroundView];
    
    CGRect rect = self.backgroundView.bounds;
    
    if(CGRectContainsPoint(rect,point))
    {
        [self startForegroundViewAnimation:point];
    }
}

- (void)startForegroundViewAnimation:(CGPoint)point
{
    [UIView animateWithDuration:0.2 animations:^
     {
         [self changeStarForegroundViewWithPoint:point];
     }];
    
}

- (void)changeStarForegroundViewWithPoint:(CGPoint)point
{
    touchIndex = ceilf(point.x / kStartImageWidth);
    self.foregroundView.frame = CGRectMake(systemHint.left, systemHint.bottom,  kStartImageWidth * touchIndex + 5, kStartRatingViewHeight);
}


-(void)dealloc
{
    self.delegate = nil;
}
@end
