//
//  ViewController.m
//  RunTimeRewriteKVO
//
//  Created by Oboe_b on 2017/9/7.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//  简书地址:http://www.jianshu.com/u/a437e8f87a81
//  微博地址:https://weibo.com/u/6342211709

#import "ViewController.h"
#import "Dog.h"
#import "NSObject+MBXB_KVO.h"
@interface ViewController ()
@property(nonatomic,strong)Dog * dog;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Dog * dog = [[Dog alloc]init];
    [dog MBXB_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    _dog = dog;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
     NSLog(@"%@===>%@",change,_dog.name);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i++;
    _dog.name = [NSString stringWithFormat:@"%d",i];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
