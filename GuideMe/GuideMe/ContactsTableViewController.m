//
//  ContactsTableViewController.m
//  GuideMe
//
//  Created by Paulo Ferreira on 14/09/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "ColorUtil.h"
#import "ContactDAO.h"
#import "ContactsHeaderView.h"
#import "ContactsCell.h"
#import "SessionData.h"
@import CoreLocation;


@interface ContactsTableViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) NSMutableArray *users;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) ContactsHeaderView* headerView;
@end

CLLocationCoordinate2D coordinates;

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [ColorUtil navigationBarTintColor];
    
    self.users = [[NSMutableArray alloc] init];
    
    SessionData *session = [SessionData sharedSessionData];
    
    [self.users addObjectsFromArray: [session.loggedUser.contacts allObjects]];
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
    [self.tableView reloadData];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *localization = [locations firstObject];
    coordinates = localization.coordinate;
    
    self.headerView.geoLocalization.text = [NSString stringWithFormat:@"Latitude: %f, Longitude: %f", coordinates.latitude, coordinates.longitude];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCellIdentifier" forIndexPath:indexPath];
    
    Contact* contact = [self.users objectAtIndex:indexPath.row];
    
    if(contact == nil) {
        return [UITableViewCell new];
    }
    
    cell.contactNameLabel.text = contact.contactName;
    cell.contactPhoneNumberLabel.text = contact.contactPhoneNumber;
    cell.contactProfileImage.image = [UIImage imageWithData:contact.profileImage];
    
    cell.contactProfileImage.layer.cornerRadius = cell.contactProfileImage.frame.size.width / 2.0;
    cell.contactProfileImage.clipsToBounds = YES;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.headerView = [ContactsHeaderView new];
    
    SessionData* session = [SessionData sharedSessionData];
    self.headerView.userProfileImage.image = [UIImage imageWithData:session.loggedUser.profileImage];
    
    self.headerView.userProfileImage.layer.cornerRadius = self.headerView.userProfileImage.frame.size.width / 2.0;
    self.headerView.userProfileImage.clipsToBounds = YES;
    
    self.headerView.greetingsLabel.text = [NSString stringWithFormat:@"Bom dia %@", session.loggedUser.name];
    
    self.headerView.geoLocalization.text = [NSString stringWithFormat:@"Latitude: %f, Longitude: %f", coordinates.latitude, coordinates.longitude];
    
    NSLocale* currentLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.dateFormat = @"EEEE, MMM d, yyyy";
    NSDate* today = [NSDate date];
    formatter.locale = currentLocale;
    self.headerView.todayLabel.text = [formatter stringFromDate:today];
    
    return self.headerView;
}
- (IBAction)logout:(id)sender {
    SessionData* session = [SessionData sharedSessionData];
    [session setLoggedUser:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
