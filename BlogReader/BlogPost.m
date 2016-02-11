//
//  BlogPost.m
//  BlogReader
//
//  Created by Michael Alford on 2/10/16.
//  Copyright (c) 2016 Michael Alford. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

// id - General purpose data type that can create an instance of any class
- (id) initWithTitle: (NSString *) title {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.author = nil;
        self.thumbnail = nil;
    }
    return self;
}

+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (NSURL *) thumbnailURL {
    return [NSURL URLWithString:self.thumbnail];
}

- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //Specify format
    NSDate *tempDate = [dateFormatter dateFromString:self.date]; //parse the date object
    
    [dateFormatter setDateFormat:@"EE MMM,dd"]; //format for our date
    return [dateFormatter stringFromDate:tempDate]; //return date as string
}

//  Setter
//- (void) setsSomeTitle:(NSString *)_title; {
//    title = _title; //access the instance variable
//}
//
//  Getter
//- (NSString *) someTitle {
//    return title;
//}

@end
