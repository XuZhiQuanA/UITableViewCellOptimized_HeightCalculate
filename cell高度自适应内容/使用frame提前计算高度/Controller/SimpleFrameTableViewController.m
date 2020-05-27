//
//  SimpleFrameTableViewController.m
//  Test
//
//  Created by 徐智全 on 2020/5/25.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "SimpleFrameTableViewController.h"
#import "FrameModel.h"
#import "FrameTableViewCell.h"

@interface SimpleFrameTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation SimpleFrameTableViewController

static NSString *reuseID = @"reuseID";

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        
        NSString *text = @"内容越来越多";
        for (NSInteger i = 0; i < 100; i++) {
            text = [text stringByAppendingString:@"内容越来越多"];
            FrameModel *model = [[FrameModel alloc] init];
            model.text = text;
            model.cellHeight = [FrameTableViewCell heightWithModel:model];
            [_dataArray addObject:model];
        }
        
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.estimatedRowHeight = 175;
    tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
    
    [tableView registerClass:[FrameTableViewCell class] forCellReuseIdentifier:reuseID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FrameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FrameModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

@end
