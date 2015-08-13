//
//  TreeNode.m
//  TreeView
//
//  Created by Emizen Tech on 13/08/15.
//  Copyright (c) 2015 EmizenTech. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode
@synthesize category_id,product_count,parent_id,name,isSelected,checkImg;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor
{
//    self = [super initWithFrame:frame];
    self = [super init];
    if (self) {
        // Initialization code
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       
        [self addTarget:self action:@selector(clickme:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [checkImg removeFromSuperview];
    checkImg= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.height-10, self.frame.size.height-10)];
    if(isSelected)
    {
        checkImg.image=[UIImage imageNamed:@"check_box.png"];
    }
    else
    {
        checkImg.image=[UIImage imageNamed:@"uncheck_box.png"];
    }
    [self addSubview:checkImg];
    
}

-(void)clickme:(TreeNode *)sender
{
    if (sender.isSelected) {
        sender.isSelected=NO;
        sender.backgroundColor=[UIColor clearColor];
        [sender setNeedsLayout];
    }
    else
    {
        sender.isSelected=YES;
        sender.backgroundColor=[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1];
        [sender setNeedsLayout];
    }
    NSLog(@"name:%@, Category_id:%d, parent_id:%d, product_count:%d",sender.name,sender.category_id,sender.parent_id,sender.product_count);
}

-(void)updateConstraints{
    // add your constraints
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *metrics = @{
                              @"top" : @(100),
                              @"height" : @(20),
                              @"left" : @(100),
                              @"width" : @(200)
                              };
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[self(==width)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:NSDictionaryOfVariableBindings(self)]];
    if (self.parent_id==1) {
        [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[self(==height)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:NSDictionaryOfVariableBindings(self)]];
    }
    else
    {
        NSArray *subviews = self.superview.subviews;
        
        for(UIView *view in subviews){
            if(view.tag == self.tag){
                // Do something with that view
                
                [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-(top)-[self(==height)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics views:NSDictionaryOfVariableBindings(self,view)]];
            }
        }
        
        
    }
    
    [super updateConstraints];
    
}

@end
