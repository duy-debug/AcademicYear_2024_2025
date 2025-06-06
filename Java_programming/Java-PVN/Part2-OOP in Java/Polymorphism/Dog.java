public class Dog extends Animal {
  // constructors for a Dog object

  private String name;        // Name of a Dog
  private String breed;      // Dog breed

  public Dog(String aName) {
    super("Dog");       // Call the base constructor
    name = aName;       // Supplied name
    breed = "Unknown";  // Default breed value
  }

  public Dog(String aName, String aBreed) {
    super("Dog");      // Call the base constructor
    name = aName;      // Supplied name
    breed = aBreed;    // Supplied breed
  }

  // Present a dog's details as a string
  public String toString() {
  return "It's " + name + " the " + breed;
  }
 /*
	// Present a dog's details as a string
	public String toString() {
	  return super.toString() + "\nIt's " + name + " the " + breed;
	}

 */

  // A barking method
  public void sound() {
    System.out.println("Woof    Woof");
  }

  /* Test me to see "signature"!
  public void toString() {
  //return "It's " + name + " the " + breed;
  }
  */



}

