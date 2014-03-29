//
//  PeticionesGETViewController.m
//  peticionesGET
//
//  Created by Ruben on 28/03/14.
//  Copyright (c) 2014 AppAndWeb. All rights reserved.
//

#import "PeticionesGETViewController.h"

@interface PeticionesGETViewController ()

@end

@implementation PeticionesGETViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Se construye la web
    NSURL *url = [NSURL URLWithString:@"http://www.appandweb.es"];
    
    // Objeto de request
    request =[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    
    // Se acaba con la conexion existente en el caso de haberla
    if (connectionInProgress) {
        [connectionInProgress cancel];
    }
    
    // Se crea la instanca que guardará los datos
    data = [[NSMutableData alloc] init];
    
    // Crear e iniciar la conexion
    connectionInProgress = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

#pragma methods NSURLConecciont delegate
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)datos
{
    [data appendData:datos];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *xmlCheck = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
    if (xmlCheck != NULL && ![xmlCheck  isEqual: @""]) {
        NSLog(@"%@", xmlCheck);
    }
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    connectionInProgress = nil;
    data = nil;
    
    NSString *errorString = [NSString stringWithFormat:@"Conexión fallida: %@", [error localizedDescription]];
    NSLog(@"%@", errorString);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
