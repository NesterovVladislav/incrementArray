//
//  ViewController.m
//  incrementArray
//
//  Created by Nesterov on 02/03/17.
//  Copyright © 2017 Nesterov. All rights reserved.
//

#import "ViewController.h"
#import "ModelArray.h"

@interface ViewController ()

@end

@implementation ViewController
{
    ModelArray * model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    model = [[ModelArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)populate
{
    [model create];
}
-(IBAction)enumerate
{
    typeof(self) __weak weakSelf = self;
    [model saveEnumerationCompleteHandler:^{
        [weakSelf showAllertCount];
    }];
    [model enumeration];
    
}
-(IBAction)itemAtIndex
{
    typeof(self) __weak weakSelf = self;

    [model itemAtIndex:3 bloc:^(NSString * str) {
        [weakSelf showAllertElement:str];
    }];
}
-(void)showAllertElement:(NSString *) element
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Value Elements"
                                                                   message:[NSString stringWithFormat:@"%@%@",@" 3 Element = ", element]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)showAllertCount
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Count Elements"
                                                                   message:[NSString stringWithFormat:@"%@%d",@"Array content element = ", [model returnCount]]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
