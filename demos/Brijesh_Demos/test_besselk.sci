function test_besselk
	disp('Datatype: Double');
	i1 = [1 2 3 4 5];
	i2 = [6 7 8 9 10];
	o1 = besselk(i1,i2);
	disp(o1);
	disp('Datatype: float');
	i3 = float([1 2 3 4 5]);
	i4 = float([6 7 8 9 10]);
	o2 = besselk(i3,i4);
	disp(o2);
endfunction
