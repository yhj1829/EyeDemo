//
//  ShopListCell.m
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "ShopListCell.h"

@interface ShopListCell ()

@property(nonatomic,strong)UIImageView *picURL;

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *detailLabel;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation ShopListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=WhiteColor;
        
        self.picURL.hidden=NO;
        self.lineView.hidden=NO;
    }
    return self;
}

// picURL
-(UIImageView *)picURL
{
    if (!_picURL) {
        _picURL=[[UIImageView alloc]init];
        ViewBorderRadius(_picURL,50/2,1,ClearColor);
        [self.contentView addSubview:self.picURL];
        [self.picURL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
            make.size.mas_equalTo(CGSizeMake(100/2,100/2));
        }];
    }
    return _picURL;
}


// titleLabel
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel=[self getLabelWithText:@"王大仙" font:Font_Number(16) textColor:Color000000 textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.picURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.picURL.mas_top);
        }];
    }
    return _titleLabel;
}

// detailLabel
-(UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel=[self getLabelWithText:@"详情" font:Font_Number(12) textColor:Color333333 textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.contentView addSubview:_detailLabel];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.picURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(kmargin);
            make.right.mas_equalTo(-kmargin);
        }];
    }
    return _detailLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView=[UIView new];
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(APPW,kmargin));
        }];
        _lineView.backgroundColor=MAIN_BACK_COLOR;
    }
    return _lineView;
}
-(void)setShopListModel:(ShopListModel *)shopListModel
{
    [_picURL sd_setImageWithURL:[NSURL URLWithString:shopListModel.data[@"icon"]] placeholderImage:nil];
   
    self.titleLabel.text=shopListModel.data[@"title"];
    
    self.detailLabel.text=shopListModel.data[@"description"];
}

@end
