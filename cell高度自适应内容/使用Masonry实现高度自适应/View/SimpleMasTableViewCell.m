//
//  SimpleMasTableViewCell.m
//  Test
//
//  Created by 徐智全 on 2020/5/25.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "SimpleMasTableViewCell.h"
#import "MasModel.h"
#import <Masonry.h>

@interface SimpleMasTableViewCell()

@property(nonatomic,strong) UILabel *label;

@end

@implementation SimpleMasTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
    
    //---------greenView-----//
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:greenView];

    
    //---------label-----//
    self.label = [[UILabel alloc] init];
    self.label.numberOfLines = 0;
    self.label.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.label];
    
    //---------redView-----//
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:redView];
    
    //---------建立约束-----//
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(greenView.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
        //---------关键-----//
        make.bottom.mas_equalTo(self.contentView);
    }];
}

- (void)setModel:(MasModel *)model{
    _model = model;
    
    self.label.text = _model.text;
}

@end
