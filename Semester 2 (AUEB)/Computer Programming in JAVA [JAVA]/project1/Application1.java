import java.util.Scanner;

/*************************************************************
 *  Compilation:  		javac Application1.java
 *  Execution:    		java Application1
 *
 *	Student Name:		PETSA GEORGIA
 *  Student ID Number:	3200155
 *
 *************************************************************/
 
public class Application1 {
	
	// ---------------------- Q1 ---------------------------- 
	public static boolean isPrime (int n) {
		// Fill your code here
		int i = 1;
		int sum = 0;
		while (i <= n/2){
			if (n % i == 0) 
				sum+=1; 
				i++;
		}
		return (sum == 1); //afou mpainei mexri to miso tou arithmou, ousiastika elegxoume an diaireitai mono me tin monada 
		
		
	}//isPrime
		
	// ---------------------- Q2 ---------------------------- 
	public static int factorial(int n) {
		// Fill your code here
		int fac = 1;
		int i = 1;
		while (i <= n){
			fac *= i; 
			i++;
		}
		return fac;
	}//factorial
	
	// ---------------------- Q3 ---------------------------- 	
	public static int combinations(int n, int k) {
		// Fill your code here
		return (factorial(n)/(factorial(k)*factorial(n-k)));
		
		
	}// combinations
	
	// ---------------------- Q4 ---------------------------- 
	public static int digitsOfInteger (int n) {
		// Fill your code here
		int sum = 0;
		while (n > 0){
			sum += 1;
			n /= 10;
		}
		return sum; 
				
		
		
	}//digitsOfInteger

	// ---------------------- Q5 ---------------------------- 
	public static void quadraticEquation (double a, double b, double c) {
		// Fill your code here
		double d = b*b - 4*a*c;
		if (d > 0){
			double x1 = (-b + Math.sqrt(d))/(2*a);
			double x2 = (-b - Math.sqrt(d))/(2*a);
			System.out.format("The first solution is %.2f", x1);
			System.out.format("\nThe second solution is %.2f", x2);
		}
		else if (d == 0){
			double x3 = (-b)/(2*a);
			System.out.format("There is a double solution. This is %.2f", x3);
		}
		else
			System.out.println("The solution is not Rational");	
		
	}//quadraticEquation

	// ---------------------- Q6 ---------------------------- 
	public static double findArea(double a, double b, double c) {
		// Fill your code here
		double t, test, emvadon;
		t = (a+b+c)/2;
		test =t*(t-a)*(t-b)*(t-c);
		if (test >=0){
			emvadon = Math.sqrt(test);
			return emvadon;
		}
		else
			return -1;
		
		
	}//findArea

	// ---------------------- Q7 ---------------------------- 
	public static int reverseDigits (int n) {
		// Fill your code here
		int rev = 0;
		while (n != 0){
			rev = rev * 10 + n % 10;
			n /= 10;
		}
		return rev;
		
	}//reverseDigits

	// ---------------------- Q8 ---------------------------- 
	public static int minDigit(int n) {
		// Fill your code here
		int min = 9;
		
		if (n==0) 
			return 0;
		
		while (n > 0){
			if (n % 10 < min) min = n%10;
		
			n/=10;
		}
		return min; 
		
		
	}//minDigit
	
		
	public static void main(String args[]) {
		
		// Fill your code here
		Scanner in = new Scanner(System.in);
		
		
		// ---------------- Q1 ----------------------------
		System.out.println("\n\nQ1 - Prime Number (n)");
		// Fill your code here
		System.out.print("n (>1) = ");
		int a = in.nextInt();
		if (isPrime(a) == true)
			System.out.println(+a+" is a Prime number");
		else
			System.out.println(+a+" is not a Prime number");
		

		// ---------------- Q2 ----------------------------
		System.out.println("\n\nQ2 - Factorial (n)");
		// Fill your code here
		System.out.print("n= ");
		int b = in.nextInt();
		System.out.println("Factorial ("+b+") = "+factorial(b));


		// ---------------- Q3 ----------------------------
		System.out.println("\n\nQ3 - Combinations (n,k)");
		// Fill your code here
		System.out.print("n= ");
		int c = in.nextInt();
		System.out.print("k= ");
		int d = in.nextInt();
		System.out.println("Combinations("+c+","+d+") = "+combinations(c,d));
		
		
		// ---------------- Q4 ----------------------------	
		System.out.println("\n\nQ4 - Number of digits");
		// Fill your code here
		
		System.out.println("Enter a positive integer:");
		System.out.print("n= ");
		int e = in.nextInt();
		
		System.out.println("Number of digits = "+digitsOfInteger(e));
		
		
		
		// ---------------- Q5 ----------------------------
		System.out.println("\n\nQ5 - Quadratic equation...");
		// Fill your code here
		System.out.print("Enter a (<>0): ");
		int f = in.nextInt();
		System.out.print("Enter b: ");
		int g = in.nextInt();
		System.out.print("Enter c: ");
		int h = in.nextInt();
		quadraticEquation(f,g,h);

		
		
		
		
		// ---------------- Q6 ----------------------------
		System.out.println("\n\nQ6 - Area of a triangle");
		// Fill your code here
		System.out.print("Enter the length of the three sides.");
		System.out.print("Enter a: ");
		double i = in.nextDouble();
		System.out.print("Enter b: ");
		double j = in.nextDouble();
		System.out.print("Enter c: ");
		double k = in.nextDouble();
		double apotelesma = findArea(i,j,k);
		if (apotelesma == -1)
			System.out.println("These inputs don't match to a triangle.");
		else
			System.out.format("The area of a triangle is: %.2f", apotelesma);

				
		
		// ---------------- Q7 ----------------------------
		System.out.println("\n\nQ7 - Reverse digits");
		// Fill your code here 
		System.out.println("Enter a positive integer:");
		System.out.print("n= ");
		int l = in.nextInt();
		System.out.println("The reversed number is = "+reverseDigits(l));
		
			
		
		// ---------------- Q8 ----------------------------	
		System.out.println("\n\nQ8 - Min Digit");
		// Fill your code here
		System.out.println("Enter a positive integer:");
		System.out.print("n= ");
		int m = in.nextInt();
		System.out.println("Min Digit = "+minDigit(m));
				
		
    } //main

} //Application1
