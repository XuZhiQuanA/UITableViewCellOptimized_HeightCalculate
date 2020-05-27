//
//  ViewController.m
//  Test
//
//  Created by 徐智全 on 2020/5/20.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "ViewController.h"
#import "SimpleMasViewController.h"
#import "SimpleFrameTableViewController.h"
#import <Masonry.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

static NSString *ID = @"reuseID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view);
        make.center.mas_equalTo(self.view);
    }];

    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"numberOfRowsInSection Row:%ld",section);
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellForRowAtIndexPath row:%ld",indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"使用Masonry实现高度自适应";
            break;
            
        case 1:
            cell.textLabel.text = @"frame提前计算cell高度";
            
        default:
            break;
    }
    
    
    return cell;
}


#pragma delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            SimpleMasViewController *simVc = [[SimpleMasViewController alloc] init];
            [self.navigationController pushViewController:simVc animated:YES];
        }
            break;
            
        case 1:
        {
            SimpleFrameTableViewController *frameVc = [[SimpleFrameTableViewController alloc] init];
            [self.navigationController pushViewController:frameVc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}



@end
