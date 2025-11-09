/***************************
 Name: Emily Foreacre
 
 Project 1
 
 Title: productDriver.java
 
 Description: Driver class that represents product inventory
 
 Date: 02/16/2025
 
 ****************************/
import java.util.Scanner;

public class productDriver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// declare the scanner
		Scanner keyboard = new Scanner(System.in);
		
		// create two product objects
		Product oranges = new Product("Oranges", "456399", 2.34, 6);
		Product cereal = new Product("Fruit Loops", "283543", 12.99, 1);
		
		// input user to enter the name of the new product
		System.out.println("Please enter the name of the product you are adding: ");
        String productName = keyboard.nextLine();
        
        // declare skuIsVaild and productSku
        boolean skuIsUnique = false;
        String productSku = "";
       
        // while loop to check the uniqueness of SKU
        while (!skuIsUnique) {
            System.out.println("Please enter the SKU of the product you are adding: ");
            productSku = keyboard.nextLine();

            // product object to check SKU uniqueness using the equals() method
            Product newProductSku = new Product(productName, productSku, 0.0, 0);

            // if-else statement to check if the SKU already exists using equals() method
            if (oranges.equals(newProductSku) || cereal.equals(newProductSku)) {
                System.out.println("SKU already exists. Please enter a new SKU:\n");
            } else {
                skuIsUnique = true; // SKU is valid, exit the loop
            }
        }
        // input user to enter the price of the new product
        System.out.println("Please enter the price of the product you are adding: ");
        double productPrice = keyboard.nextDouble();
        
        // input user to enter the quantity of the new product
        System.out.println("Please enter the quantity of the product you are adding: ");
        int productQuantity = keyboard.nextInt();

        // Create the new product with user input
        Product newProduct = new Product(productName, productSku, productPrice, productQuantity);
        
        // Create testProduct as a copy of the oranges product
        Product testProduct = new Product(oranges);
        
        // thank you statement
        System.out.println("\nThank you for providing the above information!");
        
        // tell user that a new product, that is a copy of the oranges object, was created
        System.out.println("\n*** Creating a new product which is a copy of 'oranges' ***");
        
        //title label 
        System.out.println("\nPrinting all the products out:");
        
        // print out each object using the toString() method
        System.out.println(oranges.toString()); 
        
        System.out.println(cereal.toString()); 
        
        System.out.println(newProduct.toString()); 
        
        System.out.println(testProduct.toString()); 
        
        // print out updating quantity statement
        System.out.println("\n*** Updating the quantity of oranges to 10 ***");
       
        // updating quantity of testProduct using the setQuantity() method
        testProduct.setQuantity(10);
        
        //title label again
        System.out.println("\nNow printing all the products again:");

        // print out each object using the toString() method
        System.out.println(oranges.toString()); 
        
        System.out.println(cereal.toString()); 
        
        System.out.println(newProduct.toString()); 
        
        System.out.println(testProduct.toString()); 
		
        // Display total number of products
        System.out.println("\nTotal number of products in the store: " + Product.getTotalNumberOfProducts());
        
        // end statement
        System.out.println("\nThank you for using this program! \n...............END...............");

	}

}
/***************************************************************

Please enter the name of the product you are adding: 
Frozen Pizza
Please enter the SKU of the product you are adding: 
456399
SKU already exists. Please enter a new SKU:

Please enter the SKU of the product you are adding: 
392024
Please enter the price of the product you are adding: 
10.99
Please enter the quantity of the product you are adding: 
3

Thank you for providing the above information!

*** Creating a new product which is a copy of 'oranges' ***

Printing all the products out:

Product Info: 
name=         Oranges
sku=          456399
cost=         2.34
quantity=     6

Product Info: 
name=         Fruit Loops
sku=          283543
cost=         12.99
quantity=     1

Product Info: 
name=         Frozen Pizza
sku=          392024
cost=         10.99
quantity=     3

Product Info: 
name=         Oranges
sku=          456399
cost=         2.34
quantity=     6

*** Updating the quantity of oranges to 10 ***

Now printing all the products again:

Product Info: 
name=         Oranges
sku=          456399
cost=         2.34
quantity=     6

Product Info: 
name=         Fruit Loops
sku=          283543
cost=         12.99
quantity=     1

Product Info: 
name=         Frozen Pizza
sku=          392024
cost=         10.99
quantity=     3

Product Info: 
name=         Oranges
sku=          456399
cost=         2.34
quantity=     10

Total number of products in the store: 5

Thank you for using this program! 
...............END...............

******************************************************/
