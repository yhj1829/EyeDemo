//
//  UIView+Extension.m
//  QBPatient
//
//  Created by 阳光 on 16/7/30.
//  Copyright © 2016年 QB. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (UILabel *)getLabelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)color
                textAlignment:(NSTextAlignment)alignment
                lineBreakMode:(NSLineBreakMode)lineBreak
                numberOfLines:(NSInteger)number
{
    UILabel *label      = [[UILabel alloc] init];
    label.text          = text ? text:@"";
    label.font          = font ? font:[UIFont systemFontOfSize:12.0f];
    label.textColor     = color ? color:[UIColor blackColor];
    label.textAlignment = alignment;
    label.lineBreakMode = lineBreak;
    label.numberOfLines = number;
    return label;
}

- (UIButton *)getButtonWithType:(UIButtonType)type
                          title:(NSString *)title
                          image:(UIImage *)image
                backgroundColor:(UIColor *)backgroundColor
{
    UIButton *button = [UIButton buttonWithType:type];
    [button setTitle:title ? title:@"" forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor ? backgroundColor:[UIColor whiteColor];
    return button;
}


@end
