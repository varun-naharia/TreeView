//
//  TreeNode.h
//  TreeView
//
//  Created by Emizen Tech on 13/08/15.
//  Copyright (c) 2015 EmizenTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TreeNode : UIButton

@property int category_id;
@property(strong)NSString *name;
@property int parent_id;
@property int product_count;
@property BOOL isSelected;
@property(strong)UIImageView *checkImg;
- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor;

@end
