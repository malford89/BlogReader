//
//  BlogPost.h
//  BlogReader
//
//  Created by Michael Alford on 2/10/16.
//  Copyright (c) 2016 Michael Alford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

// id - General purpose data type that can create an instance of any class
// Designated Initializer
- (id) initWithTitle: (NSString *) title;
+ (id) blogPostWithTitle:(NSString *) title;

- (NSURL *) thumbnailURL;

- (NSString *) formattedDate;


@end
