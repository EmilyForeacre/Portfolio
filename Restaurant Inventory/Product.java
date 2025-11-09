/***************************
 Name: Emily Foreacre
 
 Project 1
 
 Title: Product.java
 
 Description: represents product inventory
 
 Date: 02/16/2025
 
 ****************************/
public class Product {
	
	//declare instance variables
	private String name;
	private String sku;
	private double cost;
	private int quantity;
	
	// initialize static variable
	public static int totalNumberOfProducts = 0;
	

	// default constructor
	public Product () {
		name="";
		sku="";
		cost=0.0;
		quantity=0;
		
		// increase the static variable 'totalNumberOfProducts' by 1
		totalNumberOfProducts ++;
	}
	// overloaded constructor
	public Product (String n, String s, double c, int q) {
		this.name= n;
		this.sku= s;
		this.cost= c;
		this.quantity= q;
		
		// increase the static variable 'totalNumberOfProducts' by 1
		totalNumberOfProducts ++;
	}
	// copy constructor		
	public Product(Product otherProduct) {
        this.name = otherProduct.name;
        this.sku = otherProduct.sku;
        this.cost = otherProduct.cost;
        this.quantity = otherProduct.quantity;
        
        // increase the static variable 'totalNumberOfProducts' by 1
		totalNumberOfProducts ++;

        
    }
	
	
	// get and set methods for name (STring)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	// get and set methods for SKU (String)
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	// get and set methods for cost (double)
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	// get and set methods for quantity (int)
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	// toString method to output a products information
	public String toString() {
		return "\nProduct Info: \nname=         " + name + "\nsku=          " + sku + "\ncost=         " + cost + "\nquantity=     " + quantity;
	}

	// equals method to check SKU uniqueness
	public boolean equals(Product otherProduct) {
	        return this.sku.equals(otherProduct.sku);
	    }
	
	// static method to get total number of products
	 public static int getTotalNumberOfProducts() {
	        return totalNumberOfProducts;
	 }

}
	
	
	


