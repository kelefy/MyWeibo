//
//  HomeTableViewController.m
//  MyWeibo
//
//  Created by cracker on 15/8/30.
//  Copyright (c) 2015年 cracker. All rights reserved.
//

#import "HomeTableViewController.h"
#import "AccessTokenModel.h"
#import "AccountTool.h"

@interface HomeTableViewController ()

@property (nonatomic,strong) AccessTokenModel *model;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //左边的导航项
    UIBarButtonItem *left = [self createItemWithImage:@"navigationbar_friendsearch" highlightedImg:@"navigationbar_friendsearch_highlighted" sel:nil target:nil];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *right = [self createItemWithImage:@"navigationbar_pop" highlightedImg:@"navigationbar_pop_highlighted" sel:@selector(photo) target:self];
    self.navigationItem.rightBarButtonItem = right;
    [self getNickName];
    [self getFriend];
}

-(void)photo
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)getNickName
{
    AccessTokenModel *model = self.model;
//    NSString *paramers = [NSString stringWithFormat:@"source=257987400&access_token=%@&uid=%@",model.access_token,model.uid];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?source=257987400&access_token=%@&uid=%@",model.access_token,model.uid]]];
    request.HTTPMethod = @"GET";
    //[request setHTTPBody:[paramers dataUsingEncoding:NSUTF8StringEncoding]];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *revData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        if (revData)
        {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:revData options:NSJSONReadingMutableLeaves error:nil];
            self.navigationItem.title = [json objectForKey:@"screen_name"];
            NSLog(@"title = %@",[json objectForKey:@"screen_name"]);
        }
    });
}

-(void)getFriend
{
    NSMutableURLRequest *request;
    NSString *url = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json?source=257987400&access_token=%@",self.model.access_token];
    
    request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *revData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        if(revData)
        {
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:revData options:NSJSONReadingMutableLeaves error:nil];
//            NSLog(@"%@",dic);
        }
    });
}

-(UIBarButtonItem *)createItemWithImage:(NSString *)imgName highlightedImg:(NSString *)highlightedImgName sel:(SEL)sel target:(id)target
{
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButton setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:highlightedImgName] forState:UIControlStateHighlighted];
    [rightButton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
    item.customView = rightButton;
    return item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
