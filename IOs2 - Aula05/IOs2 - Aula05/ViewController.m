//
//  ViewController.m
//  IOs2 - Aula05
//
//  Created by ADMINISTRADOR on 19/10/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Produto+CoreDataClass.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabelaCore;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self incluirProduto];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //select * from Produto
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Produto"];
    
    //where nome LIKE 'Papel'
    [fr setPredicate:[NSPredicate predicateWithFormat:@"nome ==[cd] %@", @"Papel"]];
    
    //order by validade ASC
    [fr setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"validade" ascending:YES]]];
    
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    NSError *erroFetch;
    NSArray *resultado = [context executeFetchRequest:fr error:&erroFetch];
}

-(void) incluirProduto {
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    Produto *produto = [NSEntityDescription insertNewObjectForEntityForName:@"Produto" inManagedObjectContext:context];
    
    [produto setNome:@"Papel"];
    [produto setMarca:@"Oilers Papeus"];
    [produto setPreco:12.44];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    NSDate *data = [formatter dateFromString:@"20/08/2069"];
    
    [produto setValidade:data];
    
    NSError *erroCoreData;
    if(![context save:&erroCoreData]) {
        NSLog(@"Deu erro! %@", erroCoreData);
    } else {
        NSLog(@"Produto incluido com sucesso!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
