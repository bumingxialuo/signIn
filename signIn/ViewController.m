//
//  ViewController.m
//  signIn
//
//  Created by apple7 on 2017/6/8.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "ViewController.h"
#import "HEESignInViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)signInBtnClick:(id)sender {
    HEESignInViewController *vc = [[HEESignInViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
