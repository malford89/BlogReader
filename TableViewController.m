//
//  TableViewController.m
//  BlogReader
//
//  Created by Michael Alford on 2/10/16.
//  Copyright (c) 2016 Michael Alford. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//      Bonus objective pulling from google search results
//    NSURL *blogURL = [NSURL URLWithString:@"https://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=Apple"];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/?count=20"];
    
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    //NSLog(@"%@",dataDictionary);
    
    self.blogPosts = [NSMutableArray array];
    NSArray *blogPostArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *bpDictionary in blogPostArray) {
        // takes data from the dictionary and stores it into the blogpost array
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
    
    
    
//      Orginal code for assignment:
    //self.blogPosts = [dataDictionary objectForKey:@"posts"];
    
//    For the bonus challenge to pull data from google
//    self.blogPosts = [[dataDictionary objectForKey:@"responseData"] objectForKey:@"results"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    

//      Code for bonus objective pulling/displaying search results from google:
//    cell.textLabel.text = [blogPost valueForKey:@"titleNoFormatting"];
//    cell.detailTextLabel.text = [blogPost valueForKey:@"visibleUrl"];
 
//      Code for orginal assignment:
    
    // if the thumbnail is a string then do this
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    // if it is not a string like null then use treehouse image.
    } else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Author: %@ - %@", blogPost.author, [blogPost formattedDate]];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Preparing for segue: %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"showBlogPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    Erased code. Will open up links in safari. Now we will open links and not leave the application
////    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
////    UIApplication *application = [UIApplication sharedApplication];
////    [application openURL:blogPost.url];
//    
//    // Navigation logic may go here. Create and push another view controller.
//    
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//    
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//    
//}

@end
