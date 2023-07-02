## [Библиотека работы с простыми числами](../libs/primes.erl)
|Функция|Описание|  
|-------------------|------------------------------------------------------------|  
|*is(N)*| Проверка целого числа *N* на простоту|  
|*list(N)*| Список простых чисел не превышающих *N* |  
|*count(N)*| Количество простых чисел не превышающих *N*|  
|*seq(M, N)*| Список простых чисел из диапазона *M* .. *N*|  
|*factors(N)*| Список простых множителей натурального *N*|  
|*less(N)*| Ближайшее к *N* простое число, не превышающее его|  
|*next(N)*| Ближайшее к *N* простое число не меньшее его|  
|*twins(N)*| Ближайшие к *N* простые числа-близнецы, не превышающее его|  
|*rnd(M, N)*| Случайное простое число из диапазона *M* .. *N*|  

Зависимости от библиотечных модулей: *tests* (только при [тестировании](../libs/tests/primes_tests.erl))