//
//  ViewController.m
//  TreeView
//
//  Created by Emizen Tech on 13/08/15.
//  Copyright (c) 2015 EmizenTech. All rights reserved.
//

#import "ViewController.h"
#import "TreeNode.h"
#import "TreeView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dict,cat,selectedcell,previousselectedcell,collapse,previousIndexpath,isClickedArray,isGroupCheckedArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dict=[[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"category" ofType:@"plist"]];
    cat =[[NSMutableDictionary alloc] init];
    cat =[dict objectForKey:@"categoriesList"];
    NSLog(@"%@",cat);
    
    TreeView *treeView = [[TreeView alloc] initWithFrame:CGRectMake(0, 0, 400, 800) andData:self.dict];
    [self.view addSubview:treeView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
