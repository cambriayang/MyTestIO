//
//  WithASDKTableViewCell.m
//  ASDKTestOn4S
//
//  Created by CambriaYang on Mar/28/2016.
//  Copyright © 2016 CambriaYang. All rights reserved.
//

#import "WithASDKTableViewCell.h"

@implementation WithASDKTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
//        ASTextNode *title = [[ASTextNode alloc] init];
//        
//        title.attributedString = [[NSAttributedString alloc] initWithString:@"I am the title"];
//        
//        title.frame = CGRectMake(24, 20, 80, 20);
//        
//        title.maximumNumberOfLines = 1;
//        
//        [self.contentView addSubview:title.view];
//        
//        ASTextNode *desc = [[ASTextNode alloc] init];
//        
//        desc.attributedString = [[NSAttributedString alloc] initWithString:@"You are good. Yeah"];
//        
//        desc.frame = CGRectMake(CGRectGetMinX(title.frame), CGRectGetMaxY(title.frame) + 12, 150, 20);
//        
//        desc.maximumNumberOfLines = 1;
//        
//        [self.contentView addSubview:desc.view];
//        
//        ASImageNode *image = [[ASImageNode alloc] init];
        
//        image.image = [UIImage imageNamed:@"hammer"];
//        
//        image.frame = CGRectMake(CGRectGetMaxX(self.frame) - 49 - 10, CGRectGetMinY(self.frame)+ 20, 49, 40.5);
//        
//        [self.contentView addSubview:image.view];
    }
    
    return self;
}

@end
