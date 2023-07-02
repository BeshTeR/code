## [Библиотека работы с бесконечными периодическими цепными дробями](../libs/chain.erl)
Данная библиотека реализует представление бесконечных периодических цепных дробей и операции с ними.  
Цепные дроби расширяют множество рациональных чисел (см. модуль *rat*) и позволяют кодировать точные значения некоторых  
**иррациональных чисел** конечными выражениями, в которые входят только целые положительные числа.  
Оперирование данными величинами происходит без округлений, которые бывают при работе с обычными вещественными числами.  

Бесконечная периодическая цепная дробь ```a0 + 1/(a1 + 1/(a2 + 1/(a3 + ... + aN + {1/(b1 + 1/(b2 + 1/(b3 ... 1/bM} ...```  
представляется в виде: ```{a0, [a1, a2, a3, ... aN], [b1, b2, ... bM]}```  
где:  
```a0, a1, a2, a3, ... aN``` - непериодическая часть дроби (```a0``` - целая часть)  
```b1, b2, b3, ... bM``` - периодическая часть дроби  

**ПРИМЕРЫ:**  
"Золотое сечение", число **fi** (точно): ```chain:make(1, [], [1]).```  
в вещественное число: ```chain:to_float(chain:depth(50, chain:fi())).```  
или так: ```chain:to_float(chain:depth(50, chain:make(1, [], [1]))).```  

Квадратный корень из 2 (точно): ```chain:make(1, [], [2]).```  
в вещественное число: ```chain:to_float(chain:depth(50, chain:sqrt2())).```  
или так: ```chain:to_float(chain:depth(50, chain:make(1, [], [2]))).```  

Число **pi** (приближение конечной цепной дробью): ```chain:make(3, [7,15,1,292,1,1,1,2,1,3,1,14,2,1,1,2,2,2,2,1,84,2,1,1,15]).```  
в вещественное число: ```chain:to_float(chain:pi()).```  
или так: ```chain:to_float(chain:make(3, [7,15,1,292,1,1,1,2,1,3,1,14,2,1,1,2,2,2,2,1,84,2,1,1,15])).```  

Так как значения *fi* и *sqrt2* выражены точными значениями в виде бесконечных цепных дробей, то перед преобразованием  
их в вещественные числа мы производим усечение точных значений до конечных цепных дробей функцией *chain:depth/2*  

|Функция|Описание|  
|-----------------|-----------------------------------------------------------|  
|*make(N, L1)*| Конструктор конечной цепной дроби|  
|*make(N, L1, L2)*| Конструктор бесконечной периодической цепной дроби|  
|*split(C)*| Разобрать цепную дробь на целую, конечную и бесконечную части|  
|*is_chain(C)*| Это цепная дробь ?|  
|*is_infinity(C)*| Это бесконечная периодическая цепная дробь ?|  
|*depth(C)*| Глубина цепной дроби|  
|*depth(N, C)*| Установить глубину цепной дроби не более, чем *N* (усечение до не более чем *N* элементов)|  
|*nth(N, C)*| *N*-й элемент цепной дроби|  
|*to_string(C)*| Преобразовать цепную дробь в строку|  
|*to_list(C)*| Преобразовать конечную цепную дробь в список|  
|*to_rat(C)*| Преобразовать конечную цепную дробь в рациональной число|  
|*to_float(C)*| Преобразовать конечную цепную дробь в вещественное число|  
|*from_natural(N)*| Преобразовать натуральное число в цепную дробь|  
|*from_rat(R)*| Преобразовать рациональное число в цепную дробь|  
|*from_float(X, N)*| Преобразовать вещественное число в цепную дробь (учитывая *N* знаков после запятой)|  
|*equal(C1, C2)*| Сравнение цепных дробей на равенство (*C1* =:= *C2*)|  
|*greq(C1, C2)*| Сравнение цепных дробей на больше (*C1* > *C2*)|  
|*less(C1, C2)*| Сравнение цепных дробей на меньше (*C1* < *C2*)|  
|*under(C1, C2)*| Цепная дробь является поддробью другой цепной дроби (*C1* <- *C2*)|  
|*mul(C1, C2)*| Умножение конечных цепных дробей (*C1* * *C2*)|  
|*division(C1, C2)*| Деление конечных цепных дробей (*C1* / *C2*)|  
|*add(C1, C2)*| Сложение конечных цепных дробей (*C1* + *C2*)|  
|*sub(C1, C2)*| Модуль разности конечных цепных дробей *abs*(*C1* - *C2*)|  
|*rev(C)*| Цепная дробь обратная данной (1/*C*)|  
|*fi()*| "Золотое сечение", число **fi** (точно)|  
|*sqrt2()*| Квадратный корень из 2 (точно)|  
|*pi()*| Число **pi** (приближение конечной цепной дробью)|  

Функция применима к бесконечным цепным дробям, если в ее описании не сказано, что она применима только к конечным цепным дробям.  
 
Зависимости от библиотечных модулей: *rat*, *tests* (последний только при [тестировании](../libs/tests/chain_tests.erl))