class Outer {
	private int outer_x = 100;//Bi?n c?a l?p bao
	void test() {
		Inner inner = new Inner();
		inner.display_x();//G?i ph��ng th?c in bi?n c?a l?p bao
	}
	class Inner { //Co� th�� truy xu��t tr��c ti��p bi��n ���i t���ng cu�a l��p Outer
		public int inner_y = 10;//Bi?n c?a l?p n?i b?
		void display_x() { 
		System.out.println("display : outer_x = " + outer_x);
		}
	}
	void display_y() { //Kh�ng th�� truy xu��t bi��n ���i t���ng cu�a l��p Inner
		//System.out.println("display : inner_y = " + inner_y); //L?i
	}
}

class InnerClassDemo {
	public static void main(String args[]) {
		Outer outer = new Outer();
		outer.test();
	}
}

