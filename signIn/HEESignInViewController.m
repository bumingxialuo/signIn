//
//  HEESignInViewController.m
//  signIn
//
//  Created by apple7 on 2017/6/8.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEESignInViewController.h"
#import "AppColor.h"
#import "UIView+SDAutoLayout.h"
#import "HYCalendarView.h"

@interface HEESignInViewController ()
@property(nonatomic, strong) UIImageView *headIMG;
@property(nonatomic, strong) HYCalendarView *calendarView;
@end

@implementation HEESignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_WHITE_;
    
    [self layoutNavBar];
    [self layoutSignInSubviews];
}

- (void)layoutNavBar {
    self.title = [NSString stringWithFormat:@"签到"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],
                                                                      NSForegroundColorAttributeName:COLOR_TITLE_FONT_}];
    [self.navigationController.navigationBar setTintColor:COLOR_TITLE_FONT_];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)layoutSignInSubviews {
    UIImageView *BG = [[UIImageView alloc] init];
    BG.image = [UIImage imageNamed:@"beijing"];
    BG.frame = self.view.frame;
    [self.view sd_addSubviews:@[BG]];
    
    UIImageView *BG2 = [[UIImageView alloc] init];
    BG2.image = [UIImage imageNamed:@"jinbi"];
    BG2.frame = BG.frame;
    [BG addSubview:BG2];
    
    UIImageView *headIMG = [[UIImageView alloc] init];
    headIMG.image = [UIImage imageNamed:@"touxiang"];
    headIMG.layer.borderColor = COLOR_IMGBOARD_.CGColor;
    headIMG.layer.masksToBounds = YES;
    headIMG.layer.borderWidth = 1.0;
    headIMG.layer.cornerRadius = 32;
    
    UILabel *userNameLabel = [[UILabel alloc] init];
    userNameLabel.text = @"小胖的小鱼";
    userNameLabel.textColor = [UIColor whiteColor];
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    userNameLabel.font = [UIFont systemFontOfSize:16];
    
    UIButton *singInBtn = [[UIButton alloc] init];
    singInBtn.frame = CGRectMake(10, 155, 355, 38);
    singInBtn.userInteractionEnabled = YES;
    singInBtn.layer.masksToBounds = YES;
    singInBtn.layer.cornerRadius = 5.0;
    [singInBtn setTitle:@"签到" forState:UIControlStateNormal];
    singInBtn.backgroundColor = COLOR_WHITE_;
    [singInBtn setTitleColor:COLOR_IMGBOARD_ forState:UIControlStateNormal];
    [singInBtn setTitleColor:COLOR_RED_ forState:UIControlStateSelected];
    [singInBtn setTitle:@"已签到" forState:UIControlStateSelected];
    [singInBtn addTarget:self action:@selector(singInBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"每日签到可领取5积分，连续签到一月送50积分";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:12];
    label1.textAlignment = NSTextAlignmentLeft;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"本月签到记录:";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentLeft;
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor =  COLOR_IMGBOARD_;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    // demo1
    HYCalendarView *calendarView = [[HYCalendarView alloc] init];
    self.calendarView = calendarView;
    calendarView.frame = CGRectMake(27, 270, size.width-54, 257);
    [self.view addSubview:calendarView];
    
    //设置已经签到的天数日期
    NSMutableArray* _signArray = [[NSMutableArray alloc] init];
    [_signArray addObject:[NSNumber numberWithInt:1]];
    [_signArray addObject:[NSNumber numberWithInt:2]];
    [_signArray addObject:[NSNumber numberWithInt:5]];
    [_signArray addObject:[NSNumber numberWithInt:9]];
    calendarView.signArray = _signArray;
    
    
    calendarView.date = [NSDate date];
    
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    //日期点击事件
    __weak typeof(HYCalendarView) *weakDemo = calendarView;
    calendarView.calendarBlock =  ^(NSInteger day, NSInteger month, NSInteger year){
        if ([comp day]==day) {
            NSLog(@"%li-%li-%li", year,month,day);
            //根据自己逻辑条件 设置今日已经签到的style 没有签到不需要写
            [weakDemo setStyle_Today_Signed:weakDemo.dayButton];
            [weakDemo setDuigouStyle_Today_Signed:weakDemo.dayIMG againLabel:weakDemo.dayLabel];
        }
    };
//    calendarView.frame = CGRectMake(10, 300, [UIScreen mainScreen].bounds.size.width - 20, 200);
    
    [BG2 sd_addSubviews:@[headIMG, userNameLabel, label1, label2, bgView]];
    [self.view addSubview:calendarView];
    [self.view addSubview:singInBtn];
    
    headIMG.sd_layout
    .topSpaceToView(BG2, 56)
    .centerXEqualToView(BG2)
    .widthIs(64)
    .heightIs(64);
    
    userNameLabel.sd_layout
    .topSpaceToView(headIMG, 0)
    .centerXEqualToView(headIMG)
    .heightIs(25)
    .widthIs(100);
    
//    singInBtn.sd_layout
//    .topSpaceToView(userNameLabel, 10)
//    .centerXEqualToView(userNameLabel)
//    .heightIs(38)
//    .widthIs(355);
    
    label1.sd_layout
    .topSpaceToView(userNameLabel, 53)
    .leftSpaceToView(BG2, 10)
    .widthIs(300)
    .heightIs(25);
    
    label2.sd_layout
    .topSpaceToView(label1, 20)
    .leftEqualToView(label1)
    .widthIs(300)
    .heightIs(25);
    
    bgView.sd_layout
    .topSpaceToView(label2, 0)
    .leftSpaceToView(BG2, 17)
    .rightSpaceToView(BG2, 17)
    .heightIs(276);
}

- (void)singInBtnClick {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
        __weak typeof(HYCalendarView) *weakDemo = self.calendarView;
        [weakDemo setStyle_Today_Signed:weakDemo.dayButton];
        [weakDemo setDuigouStyle_Today_Signed:weakDemo.dayIMG againLabel:weakDemo.dayLabel];


    NSLog(@"点击 签到");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
