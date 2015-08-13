//
//  ViewController.m
//  TreeView
//
//  Created by Emizen Tech on 13/08/15.
//  Copyright (c) 2015 EmizenTech. All rights reserved.
//

#import "ViewController.h"
#import "TreeNode.h"

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
    
    //TreeNode *node = [TreeNode buttonWithType:UIButtonTypeCustom];
    TreeNode *node = [[TreeNode alloc] initWithFrame:CGRectMake(100, 100, 200, 40) withBackgroundColor:[UIColor clearColor]];
    [node setTitle:@"Cart" forState:UIControlStateNormal];
    
    node.name=@"cat1";
    node.category_id=2;
    node.parent_id=1;
    node.product_count=5;
    node.tag=node.category_id;
//    /node.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:node];
    
    TreeNode *node2 = [[TreeNode alloc] initWithFrame:CGRectMake(100, 100, 200, 40) withBackgroundColor:[UIColor clearColor]];
    [node2 setTitle:@"Cart" forState:UIControlStateNormal];
    
    node2.name=@"cat1";
    node2.category_id=5;
    node2.parent_id=2;
    node2.product_count=5;
    node.tag=node.parent_id;
    //    /node.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:node2];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
