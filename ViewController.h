//
//  ViewController.h
//  TreeView
//
//  Created by Emizen Tech on 13/08/15.
//  Copyright (c) 2015 EmizenTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSMutableArray *itemsInTable;
@property(nonatomic,retain)NSMutableDictionary *dict;
@property(nonatomic,retain)NSMutableDictionary *cat;
@property(nonatomic) int selectedcell;
@property(nonatomic) int previousselectedcell;
@property(nonatomic) NSString *collapse;
//@property(nonatomic,strong) InterestTableViewCell *cell;
//@property(nonatomic,retain)NSMutableDictionary *category;
@property(weak,nonatomic) NSIndexPath *previousIndexpath;
@property (nonatomic, retain) NSMutableArray *isClickedArray;
@property (nonatomic, retain) NSMutableArray *isGroupCheckedArray;

@end

