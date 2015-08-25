//
//  TreeView.m
//  TreeView
//
//  Created by Emizen Tech on 13/08/15.
//  Copyright (c) 2015 EmizenTech. All rights reserved.
//

#import "TreeView.h"
#import "TreeNode.h"

@implementation TreeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame andData:(NSMutableDictionary *)dict
{
    self = [super initWithFrame:frame];
    
//    NSLog(@"%lu",(unsigned long)[[dict objectForKey:@"categoriesList"] count]);
    
    if (self) {
        int total =(int)[[dict objectForKey:@"categoriesList"] count];
        if(total!=0)
        {
            for (int i =0 ; i<total; i++) {
                //TreeNode *node = [TreeNode buttonWithType:UIButtonTypeCustom];
                NSString *name = [[[dict objectForKey:@"categoriesList"] objectAtIndex:i] valueForKey:@"name"];
                int category_id = [[[[dict objectForKey:@"categoriesList"] objectAtIndex:i] valueForKey:@"category_id"] intValue];
                int parent_id = [[[[dict objectForKey:@"categoriesList"] objectAtIndex:i] valueForKey:@"parent_id"] intValue];
                int product_count = [[[[dict objectForKey:@"categoriesList"] objectAtIndex:i] valueForKey:@"product_count"] intValue];
                
                TreeNode *node = [[TreeNode alloc] initWithFrame:frame withBackgroundColor:[UIColor clearColor]];
                [node setTitle:name forState:UIControlStateNormal];
                node.name=name;
                node.category_id=category_id;
                node.parent_id=parent_id;
                node.product_count=product_count;
                node.tag=node.category_id;
                //    /node.backgroundColor=[UIColor redColor];
                
                if([[[dict objectForKey:@"categoriesList"] objectAtIndex:i] objectForKey:@"categories"])
                {
                    
                    
                    int childTotal =(int)[[[dict objectForKey:@"categoriesList"] valueForKey:@"categories"] count];
                    for (int y=0; y<childTotal; y++) {
                        NSLog(@"%@",[[[[dict objectForKey:@"categoriesList"] valueForKey:@"categories"] objectAtIndex:i] objectAtIndex:y]);
                        TreeView *treeView = [[TreeView alloc] initWithFrame:frame andData:[[[[dict objectForKey:@"categoriesList"] valueForKey:@"categories"] objectAtIndex:i] objectAtIndex:y]];
                        [node addSubview:treeView];
                    }
                }
                [self addSubview:node];
            }
        }
        else
        {
            NSString *name = [dict valueForKey:@"name"];
            int category_id = [[dict valueForKey:@"category_id"] intValue];
            int parent_id = [[dict valueForKey:@"parent_id"] intValue];
            int product_count = [[dict valueForKey:@"product_count"] intValue];
            
            TreeNode *node = [[TreeNode alloc] initWithFrame:frame withBackgroundColor:[UIColor clearColor]];
            [node setTitle:name forState:UIControlStateNormal];
            node.name=name;
            node.category_id=category_id;
            node.parent_id=parent_id;
            node.product_count=product_count;
            node.tag=node.category_id;
            //    /node.backgroundColor=[UIColor redColor];
            
            if([dict objectForKey:@"categories"])
            {
                
                
                int childTotal =(int)[[[dict objectForKey:@"categoriesList"] valueForKey:@"categories"] count];
                for (int y=0; y<childTotal; y++) {
                    NSLog(@"%@",[[dict valueForKey:@"categories"] objectAtIndex:y]);
                    TreeView *treeView = [[TreeView alloc] initWithFrame:frame andData:[[dict valueForKey:@"categories"] objectAtIndex:y]];
                    [node addSubview:treeView];
                }
            }
            [self addSubview:node];
        }
    }
//    self.backgroundColor=[UIColor redColor];
    return self;
}

@end
