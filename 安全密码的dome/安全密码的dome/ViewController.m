//
//  ViewController.m
//  我的指纹识别的dome
//
//  Created by public on 15/9/22.
//  Copyright © 2015年 public. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "LockViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    LAContext *context = [[LAContext alloc]init];
    NSError *error;
    if (![context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"当前的设备不支持指纹识别:%@",error.localizedDescription);
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示你哦" message:@"去设置手势密码吧" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            LockViewController *lock = [[LockViewController alloc]init];
            [self presentViewController:lock animated:YES completion:nil];

        }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
  
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"这是可以自定义文字的" reply:^(BOOL success, NSError *authenticationError) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (success) {
                
                UIButton *bbb = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 100, 100)];
                bbb.backgroundColor = [UIColor redColor];
                [self.view addSubview:bbb];
            }else{
                NSLog(@"搞不个error == :%@",authenticationError);
                if (authenticationError.code==-3) {
                    NSLog(@"输入登陆密码");
                }
                if (authenticationError.code==-2) {
                    NSLog(@"取消指纹验证");
                }
                if (authenticationError.code==-8) {
                    NSLog(@"设备被锁了");
                }
                if (authenticationError.code==-1) {
                    NSLog(@"多次验证指纹失败");
                }
            }
            
            
        }) ;
    }];
    
    
}



@end
