//
//  UIView+Extension.h
//  QBPatient
//
//  Created by 阳光 on 16/7/30.
//  Copyright © 2016年 QB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  初始化相关属性，返回label对象
 *
 *  @param dic 设置先关属性的字典
 *
 *  @return 返回 UILabel对象
 */
- (UILabel *)getLabelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                textAlignment:(NSTextAlignment)alignment
                lineBreakMode:(NSLineBreakMode)lineBreak
                numberOfLines:(NSInteger)number;
/**
 *  button初始化相关属性，返回button对象
 *
 *  @param type  类型
 *  @param title 标题
 *  @param image 图片
 *
 *  @return 返回button对象
 */
- (UIButton *)getButtonWithType:(UIButtonType)type
                          title:(NSString *)title
                          image:(UIImage *)image
                backgroundColor:(UIColor *)backgroundColor;

@end
