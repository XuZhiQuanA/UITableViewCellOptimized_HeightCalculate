//
//  SimpleMasViewController.m
//  Test
//
//  Created by 徐智全 on 2020/5/25.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "SimpleMasViewController.h"
#import "MasModel.h"
#import "SimpleMasTableViewCell.h"
@interface SimpleMasViewController ()<UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation SimpleMasViewController

#pragma lazy load
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        NSString *text = @"内容越来越多";
        for (NSInteger i = 0; i < 100; i++) {
            text = [text stringByAppendingString:@"内容越来越多"];
            MasModel *model = [[MasModel alloc] init];
            model.text = text;
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}

static NSString *ID = @"reuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //---------tableView-----//
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tableView];
    tableView.estimatedRowHeight = 175;
    tableView.dataSource = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [tableView registerClass:[SimpleMasTableViewCell class] forCellReuseIdentifier: ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SimpleMasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
    
}



@end
