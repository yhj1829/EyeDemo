//
//  ShopListVC.m
//  EyeDemo
//
//  Created by 阳光 on 16/12/3.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "ShopListVC.h"
#import "ShopListCell.h"
#import "ShopListModel.h"

static NSString *ShopListCellIdentifier=@"ShopListCellIdentifier";
@interface ShopListVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *arr;

@property(nonatomic,strong)NSString *nextPageURL;

@end

@implementation ShopListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.arr=[NSMutableArray array];
    
    [self initTableView];
    
    [self getNewData];
    
    // 默认 下拉刷新
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewData)];
    
    // 默认 上拉加载
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    [self setupRefresh];
}

-(void)showProgressHUDView
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"数据加载中..."];
}

-(void)getNewData
{
    [self showProgressHUDView];
    
    [_arr removeAllObjects];
   
    __weak typeof(self) weakSelf=self;
    [RequestTool getShopListDataWithDic:nil success:^(id res)
    {
        if ([res isKindOfClass:[NSDictionary class]])
        {
            self.nextPageURL=res[@"nextPageUrl"];
            
            if ([res[@"itemList"] count]>0)
            {
                for (NSDictionary *dic in res[@"itemList"])
                {
                    ShopListModel *model=[ShopListModel mj_objectWithKeyValues:dic];
                    [weakSelf.arr addObject:model];
                }
            }
        }
        
        [weakSelf.tableView reloadData];
        
        [self endRefreshAndProgressHUDismiss];

    } failure:^(NSError *error) {
        
        [self endRefreshAndProgressHUDismiss];
        
    }];
}

-(void)endRefreshAndProgressHUDismiss
{
    [self endRefresh];
    [SVProgressHUD dismiss];
}

-(void)endRefresh
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


-(void)setupRefresh
{
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getNewData];
    }];
    self.tableView.mj_header=header;
    
    MJRefreshAutoNormalFooter *footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    self.tableView.mj_footer=footer;
    
}

-(void)loadMoreData
{
    // 已经全部加在完毕数据时
    if ([self.nextPageURL isEqual:[NSNull null]])
    {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    else
    {
        [self showProgressHUDView];

        __weak typeof(self) weakSelf=self;
        [RequestTool getShopListMoreDataWithDic:nil byURL:self.nextPageURL success:^(id res) {
            if ([res isKindOfClass:[NSDictionary class]])
            {
                self.nextPageURL=res[@"nextPageUrl"];
                if ([res[@"itemList"] count]>0)
                {
                    for (NSDictionary *dic in res[@"itemList"])
                    {
                    ShopListModel *model=[ShopListModel mj_objectWithKeyValues:dic];
                        [weakSelf.arr addObject:model];
                    }
                }
            }
            
            [weakSelf.tableView reloadData];
            
            [self endRefreshAndProgressHUDismiss];
            
        } failure:^(NSString *error) {
            
            [self endRefreshAndProgressHUDismiss];
            
        }];
    }
}

-(void)initTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.backgroundColor=MAIN_BACK_COLOR;
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[ShopListCell class] forCellReuseIdentifier:ShopListCellIdentifier];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopListCell *cell=[tableView dequeueReusableCellWithIdentifier:ShopListCellIdentifier];
    cell.shopListModel=self.arr[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kmargin*2;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView=[UIView new];
    return footView;
}


@end
