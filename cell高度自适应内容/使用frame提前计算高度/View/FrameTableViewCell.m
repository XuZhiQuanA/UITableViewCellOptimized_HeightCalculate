//
//  FrameTableViewCell.m
//  Test
//
//  Created by 徐智全 on 2020/5/25.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "FrameTableViewCell.h"
#import "FrameModel.h"
#import "UIView+frameAdjust.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FrameTableViewCell()

/** 黄色view */
@property (nonatomic, strong) UIView *yellowView;
/** 内容label */
@property (nonatomic, strong) UILabel *label;
/** 蓝色view */
@property (nonatomic, strong) UIView *blueView;

@end

@implementation FrameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma 计算cell高度
//---------返回cell高度-----//
+ (CGFloat)heightWithModel:(FrameModel *)model{
    
    NSString *string = model.text;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange allRange = [string rangeOfString:string];
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15.0] range:allRange];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor]range:allRange];
    
    CGFloat titleHeight;
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    // 获取label的最大宽度
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX)options:options context:nil];
    
    titleHeight = ceilf(rect.size.height);
    
    return titleHeight + 60; // 动态高度 + 静态高度
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        NSLog(@"init");
        [self setupUI];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    NSLog(@"initWithStyle");
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI{
    
    self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    [self.contentView addSubview:self.yellowView];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 0)];
    [self.contentView addSubview:self.label];
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.numberOfLines = 0;
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(0, _label.maxY, SCREEN_WIDTH, 30)];
    [self.contentView addSubview:self.blueView];
    self.blueView.backgroundColor = [UIColor blueColor];
    
    
}

- (void)setModel:(FrameModel *)model{
    _model = model;
    
    self.label.text = _model.text;
    self.label.width = SCREEN_WIDTH;
    [self.label sizeToFit];
    self.blueView.y = self.label.maxY;
}

@end
