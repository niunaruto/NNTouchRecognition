//
//  LockViewController.m
//  安全密码的dome
//
//  Created by public on 15/11/6.
//  Copyright © 2015年 public. All rights reserved.
//

#import "LockViewController.h"
#import "NNLockView.h"
@interface LockViewController ()
@property (nonatomic, strong) NNLockView *lockView;
@end

@implementation LockViewController
- (NNLockView *)lockView{
    if (!_lockView) {
        _lockView = [[NNLockView alloc]init];
    }
    return _lockView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.lockView];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
