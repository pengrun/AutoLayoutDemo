//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by MH-Pengrun on 15/7/10.
//  Copyright (c) 2015年 MH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1];
//    [self example_1];
    
    [self example_2];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)example_1 {
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    view.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blueColor];
    
    UIImageView *view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [self.view addSubview:view1];
    view1.contentMode = UIViewContentModeScaleAspectFit;
    view1.backgroundColor = [UIColor yellowColor];
    
    UIImageView *view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    [self.view addSubview:view2];
    view2.contentMode = UIViewContentModeScaleAspectFit;
    view2.backgroundColor = [UIColor greenColor];
    
    UIImageView *view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    [self.view addSubview:view3];
    view3.contentMode = UIViewContentModeScaleAspectFit;
    view3.backgroundColor = [UIColor cyanColor];
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //<-------------设置View------------->
    /**
     *  View的左边距和self.view的左边距一样
     */
    NSLayoutConstraint *viewXConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0.0];
    /**
     *  view的中心Y坐标和self.view的中心Y坐标一样
     */
    NSLayoutConstraint *viewYConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.0];
    /**
     *  view的宽度等于self.view宽度的1/4即0.25
     */
    NSLayoutConstraint *viewWidthConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25f constant:0.0f];
    /**
     *  由于UIImageView设置了图片，有了高度，就直接使用view自身的高度，当然上面的宽度也可以使用图片的宽度。
     */
    NSLayoutConstraint *viewHeightConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1 constant:0.0f];
    if ([[UIDevice currentDevice].systemVersion doubleValue] < 8.0f) {
        viewXConstraint.active = YES;
        viewYConstraint.active = YES;
        viewWidthConstraint.active = YES;
        viewHeightConstraint.active = YES;
    } else {
        [self.view addConstraints:@[viewXConstraint,
                                   viewYConstraint,
                                   viewWidthConstraint,
                                   viewHeightConstraint]];
    }
    
    //<-------------设置View1------------->
    [self.view addConstraints:@[
                                //view1的x坐标等于view的最右边
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0.0],
                                //view1的中心Y坐标等于View的中心Y坐标
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1
                                                              constant:0.0],
                                //view1的宽度等于View的宽度
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1
                                                              constant:0.0],
                                //view1的高度等于View的高度
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1
                                                              constant:0.0],
                               
                                ]];
    //<-------------设置View2------------->
    [self.view addConstraints:@[
                                //view2的x坐标等于view1的最右边
                                [NSLayoutConstraint constraintWithItem:view2
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view1
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0.0],
                                //view2的中心Y坐标等于View1的中心Y坐标
                                [NSLayoutConstraint constraintWithItem:view2
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view1
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1
                                                              constant:0.0],
                                //view2的宽度等于View1的宽度
                                [NSLayoutConstraint constraintWithItem:view2
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view1
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1
                                                              constant:0.0],
                                //view2的高度等于View1的高度
                                [NSLayoutConstraint constraintWithItem:view2
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view1
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1
                                                              constant:0.0],
                                
                                ]];
    //<-------------设置View3------------->
    [self.view addConstraints:@[
                                //view3的x坐标等于view2的最右边
                                [NSLayoutConstraint constraintWithItem:view3
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view2
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0.0],
                                //view3的中心Y坐标等于View2的中心Y坐标
                                [NSLayoutConstraint constraintWithItem:view3
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view2
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1
                                                              constant:0.0],
                                //view3的宽度等于View2的宽度
                                [NSLayoutConstraint constraintWithItem:view3
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view2
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1
                                                              constant:0.0],
                                //view3的高度等于View2的高度
                                [NSLayoutConstraint constraintWithItem:view3
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view2
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1
                                                              constant:0.0],
                                
                                ]];
    
}

- (void)example_2 {
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    view.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blueColor];
    
    UIImageView *view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    [self.view addSubview:view1];
    view1.contentMode = UIViewContentModeScaleAspectFit;
    view1.backgroundColor = [UIColor yellowColor];
    
    UIImageView *view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    [self.view addSubview:view2];
    view2.contentMode = UIViewContentModeScaleAspectFit;
    view2.backgroundColor = [UIColor greenColor];
    
    UIImageView *view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    [self.view addSubview:view3];
    view3.contentMode = UIViewContentModeScaleAspectFit;
    view3.backgroundColor = [UIColor cyanColor];
    
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(self.view, view, view1,view2, view3);
    
    //计算四分之一宽度
    float quarterWidth = self.view.frame.size.width / 4;
    //获取图片高度
    float height = view.image.size.height;
    
    NSDictionary *metrics = @{@"width":[NSNumber numberWithFloat:quarterWidth],@"height":[NSNumber numberWithFloat:height]};
    
    //view 水平方向：离self.view的左边距为0.
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view(==width)]" options:0 metrics:metrics views:views]];
    
    /* view的中心Y坐标等于self.view的中心Y坐标。
     * 这里因为用到了具体的宽度和高度，如果用VFL来设置居中的话，会报错的。只能辅助用第一种方法来解决此问题。
     */
    NSLayoutConstraint *viewYConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.0];
    [self.view addConstraint:viewYConstraint];
    
    //设置view和view1、view1和view2、view2和view3间隔为0。其中 -0- 可以省去。
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-0-[view1(==view)]-0-[view2(==view1)]-0-[view3(==view2)]" options:NSLayoutFormatAlignAllBottom|NSLayoutFormatAlignAllTop metrics:nil views:views]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
