//
//  RoundProgressView.h
//  DrawRound
//
//  Created by Destiny on 2018/7/26.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundProgressView : UIView

/**进度条颜色*/
@property (strong, nonatomic) UIColor *progressColor;
/**dash pattern*/
@property (strong, nonatomic) NSArray *lineDashPattern;
/**进度Label字体*/
@property (strong, nonatomic) UIFont  *progressFont;

- (void)updateProgress:(CGFloat)progress;

@end
