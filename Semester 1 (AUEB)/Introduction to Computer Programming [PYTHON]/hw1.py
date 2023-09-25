from operator import *
from math import sqrt


#>>>>>>>>>>>>>>>>>>>>> Askhsh 1 <<<<<<<<<<<<<<<

def f(x):
    """ 
    x -- ari8mos

    Epistrefei tin timi 1/(2 + 3/(x+4) + 1/x).

    >>> f(-1)
    0.5
    >>> round(f(-2), 4)
    0.3333
    >>> round(f(-8), 4)
    0.8889
    """
    """ Xrhsimopoihste MONO ekfraseis klhshs,
        p.x., stis add, mul, pow, sqrt, truediv, ...
        OXI infix telestes (+, /, ...) """
    
    return truediv( 1, add( 2, add (truediv( 3, add( x, 4) ), truediv( 1, x) ) ) )   



#>>>>>>>>>>>>>>>>>>>>> Askhsh 2 <<<<<<<<<<<<<<<

def g(x, y):
    """
    x,y -- ari8moi

    Epistrefei timi isi me sqrt(add(pow(add(x, y), 2), pow(sub(x, y), 2)))

    >>> g(1, 1)
    2.0
    >>> g(1.5, 1.5)
    3.0
    >>> round(g(3, 1), 5)
    4.47214
    """

    """ Xrhsimopoihste infix telestes(+, -, *, **, ...)
        OXI ekfraseis klhshs """
    return ((x+y)**2+(x-y)**2)**(1/2) 



#>>>>>>>>>>>>>>>>>>>>> Askhsh 3 <<<<<<<<<<<<<<<
def how():
    """Symplhrwste ta kena wste na didetai to
       akolou8o apotelesma

    >>> how()
    1 2 3
    """
    x = -2
    y = -3
    z = 1

    x, y, z = y, z, -x
    x, y, z = y, z, -x

    print(x, y, z)



#>>>>>>>>>>>>>>>>>>>>> Askhsh 4 <<<<<<<<<<<<<<<

def func0(s):
    """Symplhrwste ta kena wste na didetai to
       akolou8o apotelesma

    >>> func0('I') + ' ' + func0('Bi') + ' ' + 'Spider'
    'Itsy Bitsy Spider'
    """

    return (s+'tsy')



#>>>>>>>>>>>>>>>>>>>>> Askhsh 5 <<<<<<<<<<<<<<<

def func1(n, c, s):
    """Symplhrwste ta kena wste:

    >>> func1(1, '*', '-')
    '*'
    >>> func1(2, '*', '-')
    '**-**'
    >>> func1(3, '*', '-')
    '***-***-***'
    >>> func1(4, 'z', 'Z')
    'zzzzZzzzzZzzzzZzzzz'
    >>> func1(1, '-', '*') == '-'
    True
    """
    return( n * c + ( ( n - 1 ) * ( s + n * c ) ) )    



#>>>>>>>>>>>>>>>>>>>>> Askhsh 6 <<<<<<<<<<<<<<<

def func2(s):
    """Symplhrwste ta kena wste na didetai to
       akolou8o apotelesma

    >>> func2('la')
    'la-la'
    >>> func2(func2('la'))
    'la-la-la-la'
    >>> func2(func2(func2('la')))
    'la-la-la-la-la-la-la-la'
    """
    return (s + "-" + s)
    


#>>>>>>>>>>>>>>>>>>>>> Askhsh 7 <<<<<<<<<<<<<<<

def digit_sum(x):
    """Ypologizei to a8roisma twn (dekadikwn) pshfiwn tou x

    x -- 8etikos akeraios

    >>> digit_sum(10000)
    1
    >>> digit_sum(615)
    12
    >>> digit_sum(23) == 5
    True
    """                                
    s = 0
    while x != 0:
        s = s + x%10
        x = x // 10
    return s 



#>>>>>>>>>>>>>>>>>>>>> Askhsh 8 <<<<<<<<<<<<<<<

def keep_summing(x):
    """Ypologizei to a8roisma twn pshfiwn synexws ews
    otou to apotelesma exei ena mono pshfio

    x -- 8etikos akeraios

    >>> keep_summing(3)
    3
    >>> keep_summing(32)
    5
    >>> keep_summing(344)
    2
    >>> keep_summing(999)
    9
    >>> print(keep_summing(999))
    9
    """
    """ GRAPSTE TON KWDIKA SAS APO KATW """
    #keep_summing(344)=2 epeidi 1o a8roisma (4+4+3=11), kai deytero a8roisma( 1+1 =2) ara
    s = 0
    while x != 0:      #edw vriskw to prwto a8roisma olwn twn pshfiwn
        s = s + x%10
        x = x // 10
    new_s = 0    
    if s > 9:          #edw vriskw to deytero a8roisma, kanontas split ta psifia tou prwtou athrismatos,an o ari8mos aytos einai megalyteros tou 9 (afou an einai <=9 den yparxoun dyo psifia gia na milame gia a8roisma)
        while s != 0:
            new_s = new_s + s % 10
            s = s // 10
        return (new_s)
    else: 
        return s 
    




#>>>>>>>>>>>>>>>>>>>>> Askhsh 9 <<<<<<<<<<<<<<<

def draw_number(x):
    """Emfanizei ton xarakthra + 'h - x fores

    >>> draw_number(5)
    +++++
    >>> draw_number(0)
    >>> draw_number(-3)
    ---
    >>> draw_number(2) == None
    ++
    True
    """
    """ GRAPSTE TON KWDIKA SAS APO KATW """
   
    if x < 0: 
        x=-x
        return ( print (x*'-'))
    elif x > 0: 
        return ( print (x*'+'))
     
      
        




#>>>>>>>>>>>>>>>>>>>>> Askhsh 10 <<<<<<<<<<<<<<<

def min_digit(x):
    """Ypologizei to mikrotero pshfio tou x

    x -- 8etikos akeraios

    >>> min_digit(45874543)
    3
    >>> min_digit(98287334) - min_digit(8)
    -6
    """
    """ GRAPSTE TON KWDIKA SAS APO KATW """
    m = 9        #m=minimum.  vazoume ti megalyteri timh sto m gia na mpei sigoura mia fora stin parakatw if kai to m na parei ws timi to teleytaio psifio tou ari8mou  
    while x != 0: 
        psifio = x % 10 
        if psifio <= m:  
            m = psifio             
        x =  x // 10 
    return m 
     
    




#>>>>>>>>>>>>>>>>>>>>> Askhsh 11 <<<<<<<<<<<<<<<

def count_digit(x, i):
    """Ypologizei to plh8os twn emfanisewn enos pshfiou

    x -- 8etikos akeraios
    i -- pshfio (1 = 1o pshfio apo dexia, 2 = 2o apo dexia, ktl.)

    >>> count_digit(1000, 1)
    3
    >>> count_digit(12944342, 2)
    3
    >>> count_digit(121,1) == 2
    True
    """
    """ GRAPSTE TON KWDIKA SAS APO KATW """
    y = x
    s = 0    
    for j in range(1,i+1):     #vriskw se poio pshfio antistoixei to i kai to ekxwrw sto s.
        s = x % 10
        x = x //10 
    plh8os = 0
    new_x = 0
    while y != 0:              #ypologizw poses fores emfanizetai to s sotn arithmo x 
        new_x = y % 10
        if new_x == s: 
            plh8os = plh8os + 1
        y = y // 10
    return plh8os
    
