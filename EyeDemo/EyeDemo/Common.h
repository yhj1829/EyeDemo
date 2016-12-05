//
//  Common.h
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#ifndef Common_h
#define Common_h

// 屏幕
#define APPW [UIScreen mainScreen].bounds.size.width
#define APPH [UIScreen mainScreen].bounds.size.height

#define kmargin         10


#define HexRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HexRGB_A(rgbValue,a)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


// 颜色
#define MAIN_BACK_COLOR             HexRGB(0xf1f1f1)

#define WhiteColor [UIColor whiteColor]

#define ClearColor [UIColor clearColor]

#define Black_Color             HexRGB(0x000000)

#define Color1A65AB             HexRGB(0x1A65AB)

#define Color000000             HexRGB(0x000000)

// 灰色
#define Gray_Color             HexRGB(0x909090)

#define Main_Color             HexRGB(0x64D5C0)

#define Color333333            HexRGB(0x333333)

#define Color979797            HexRGB(0x979797)

#define Color5C6E7C            HexRGB(0x5C6E7C)

#define ColorE5E5E5            HexRGB(0xE5E5E5)

#define ColorFF5D71            HexRGB(0xFF5D71)

#define Color59CDF0            HexRGB(0x59CDF0)

#define ColorF66E6E           HexRGB(0xF66E6E)

#define ColorD8D8D8            HexRGB(0xD8D8D8)

#define Color666666            HexRGB(0x666666)

#define ColorF2F2F2            HexRGB(0xF2F2F2)

#define Color212121            HexRGB(0x212121)

#define Color64D5C0            HexRGB(0x64D5C0)

#define Color909090            HexRGB(0x909090)

#define Color999999            HexRGB(0x999999)

#define Color757575            HexRGB(0x757575)

#define ColorFFFFFF            HexRGB(0xFFFFFF)

#define Color39C6AC            HexRGB(0x39C6AC)

#define ColorE0E0E0           HexRGB(0xE0E0E0)

#define ColorBDBDBD           HexRGB(0xBDBDBD)

#define ColorFAFAFA          HexRGB(0xFAFAFA)

#define ColorCECECE           HexRGB(0xCECECE)


#define Gray666666 [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
#define Gray333333 [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
#define GrayE5E5E5 [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]


// 字体大小设置
#define Font_Number(a)     [UIFont fontWithName:@"PingFangSC-Regular" size:a]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#endif /* Common_h */
