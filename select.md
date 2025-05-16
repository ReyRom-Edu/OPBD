
## 🔷 Общий синтаксис `SELECT` в T-SQL:

```sql
SELECT [TOP (n)] [DISTINCT]
       столбцы_или_выражения
FROM   имя_таблицы_или_представления
[JOIN тип_соединения имя_другой_таблицы ON условие_соединения]
[WHERE условия_фильтрации]
[GROUP BY выражения_группировки]
[HAVING условия_для_групп]
[ORDER BY выражения_сортировки [ASC|DESC]]
[OFFSET n ROWS FETCH NEXT m ROWS ONLY];
```

---

## 🔹 1. `SELECT`

Выбирает столбцы или выражения:

```sql
SELECT FirstName, LastName FROM Employees;
SELECT FirstName + ' ' + LastName AS FullName FROM Employees;
```

---

## 🔹 2. `TOP (n)`

Ограничение количества строк:

```sql
SELECT TOP (5) * FROM Products;
```

Можно также использовать `PERCENT`:

```sql
SELECT TOP (10) PERCENT * FROM Products;
```

---

## 🔹 3. `DISTINCT`

Удаляет дубликаты:

```sql
SELECT DISTINCT Country FROM Customers;
```

---

## 🔹 4. `FROM`

Указывает таблицу или представление:

```sql
SELECT * FROM Orders;
```

Можно использовать псевдонимы:

```sql
SELECT o.OrderID FROM Orders AS o;
```

---

## 🔹 5. `JOIN` — соединения таблиц

Типы соединений:

* `INNER JOIN` — только совпадающие записи
* `LEFT JOIN` — все из левой + совпавшие из правой
* `RIGHT JOIN` — все из правой + совпавшие из левой
* `FULL JOIN` — все записи с обеих сторон
* `CROSS JOIN` — декартово произведение

Пример:

```sql
SELECT e.FirstName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
```

---

## 🔹 6. `WHERE`

Фильтрация строк:

```sql
SELECT * FROM Orders
WHERE OrderDate >= '2024-01-01' AND Status = 'Completed';
```

Операторы:

* `=`, `<>`, `>`, `<`, `>=`, `<=`
* `BETWEEN`, `IN`, `LIKE`, `IS NULL`

---

## 🔹 7. `GROUP BY`

Группировка строк для агрегации:

```sql
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID;
```

---

## 🔹 8. `HAVING`

Фильтрация по агрегатным функциям (используется после `GROUP BY`):

```sql
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 5;
```

---

## 🔹 9. `ORDER BY`

Сортировка:

```sql
SELECT * FROM Products
ORDER BY Price DESC;
```

---

## 🔹 10. `OFFSET ... FETCH` — постраничный вывод (с SQL Server 2012)

```sql
SELECT * FROM Products
ORDER BY ProductName
OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;
```

---

## 🔹 11. Агрегатные функции

| Функция   | Назначение       |
| --------- | ---------------- |
| `COUNT()` | Кол-во записей   |
| `SUM()`   | Сумма            |
| `AVG()`   | Среднее значение |
| `MAX()`   | Максимум         |
| `MIN()`   | Минимум          |

---

## 🔹 12. Пример комплексного запроса:

```sql
SELECT TOP 10 c.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY c.CustomerName
HAVING COUNT(o.OrderID) > 5
ORDER BY TotalOrders DESC;
```

---

Если нужно, могу сделать шпаргалку по `SELECT` в формате таблицы или подготовить практические задания с разбором.
