## [Модуль для проведения тестирования](../libs/tests.erl)
|Функция|Описание|  
|----------------------------------------------------|-----------------------------------------------------------|  
|*run(Mod)*| Тестирование модуля|  
|*run(Mod, Fun, Arity)*| Тестирование функции|  
|*tc(Mod, Fun, [Args], N)*| Средняя скорость работы функции|  
|*fast([{Mod1, Fun1}, {Mod2, Fun2}, ...], [Args], N)*| Сравнение скорости работы функций на одинаковых аргументах|  
|*os()*| Запуск мониторинга системы|  
|*dbg()*| Запуск отладчика|  

[Тесты](../libs/tests/tests_tests.erl) выполняются для тех функций модуля *Mod*, для которых определены непустые списки тестов вида:  
```tests(Fun, Arity) -> [{[Args1], GoodRes1}, {[Args2], GoodRes1} ...]```

*N* - количество запусков функций, по которым берется среднее время  