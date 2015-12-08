//
//  YJListenViewController.m
//  YJProject
//
//  Created by YangJian on 15/11/21.
//  Copyright © 2015年 yangjian. All rights reserved.
//

#import "YJListenViewController.h"
#import "YJRankListCell.h"
#import "ListenViewModel.h"
#import "YJAlbumViewController.h"
@interface YJListenViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) ListenViewModel *listenVM;
@end

@implementation YJListenViewController

- (ListenViewModel *)listenVM {
    if(_listenVM == nil) {
        _listenVM = [[ListenViewModel alloc] init];
    }
    return _listenVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //这里可以用rowHeight来提高效率
    self.tableView.rowHeight = 170/2;
    self.tableView.estimatedRowHeight = 170/2;
    [self.tableView registerClass:[YJRankListCell class] forCellReuseIdentifier:@"RankListCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.listenVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error];
            }else{
                [self.tableView reloadData];
                //重置脚部
                [self.tableView.mj_footer resetNoMoreData];
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.listenVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
                if ([self.listenVM isHasMore]) {
                    [self.tableView.mj_footer endRefreshing];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listenVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YJRankListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RankListCell" forIndexPath:indexPath];
    cell.titleLb.text = [self.listenVM titleForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.listenVM iconURLForRow:indexPath.row]];
    cell.orderLb.text = @(indexPath.row + 1).stringValue;
    cell.descLb.text = [self.listenVM descForRow:indexPath.row];
    cell.numberLb.text = [self.listenVM numberForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YJAlbumViewController *vc = [[YJAlbumViewController alloc]initWithAlbumId:[self.listenVM albumIdForRow:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
