//
//  ShopListModel.h
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopListModel : NSObject

@property(nonatomic,copy)NSString *type;

@property(nonatomic,strong)NSDictionary *data;

@end


@interface ShopListDetailModel : NSObject

@property(nonatomic,copy)NSString *ImageView;

@property(nonatomic,copy)NSString *shadeView;

@end