//
//  RoundProgressView.m
//  DrawRound
//
//  Created by Destiny on 2018/7/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "RoundProgressView.h"

#define kBorderWith 10
#define center CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0)

@interface RoundProgressView()

@property (strong, nonatomic) CAShapeLayer *outLayer;
@property (strong, nonatomic) CAShapeLayer *progressLayer;
@property (strong, nonatomic) UILabel *progressLabel;

@end

@implementation RoundProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawProgress];
    }
    return self;
}

-(void)drawProgress{
    
    UIBezierPath *loopPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - kBorderWith)/ 2.0 startAngle:-M_PI_2 endAngle:M_PI * 3.0 / 2.0 clockwise:YES];
    
    // 外圈
    self.outLayer = [CAShapeLayer layer];
    self.outLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    self.outLayer.lineWidth = kBorderWith;
    self.outLayer.fillColor =  [UIColor clearColor].CGColor;
    self.outLayer.path = loopPath.CGPath;
    [self.layer addSublayer:self.outLayer];
    
    // 进度条
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor blackColor].CGColor;
    self.progressLayer.lineWidth = kBorderWith;
    self.progressLayer.strokeStart = 0;
    self.progressLayer.strokeEnd = 0;
    self.progressLayer.path = loopPath.CGPath;
    [self.layer addSublayer:self.progressLayer];
    
    // 进度Label
    self.progressLabel = [UILabel new];
    self.progressLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.progressLabel.font = [UIFont systemFontOfSize:40];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.progressLabel];
}

- (void)updateProgress:(CGFloat)progress {
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.5];
    self.progressLayer.strokeEnd =  progress / 100.0;
    [CATransaction commit];
    
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f",progress];
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
    _lineDashPattern = lineDashPattern;
    self.outLayer.lineDashPattern = lineDashPattern;
    self.progressLayer.lineDashPattern = lineDashPattern;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    self.progressLayer.strokeColor = progressColor.CGColor;
    self.progressLabel.textColor = progressColor;
}

- (void)setProgressFont:(UIFont *)progressFont
{
    self.progressLabel.font = progressFont;
}

@end
