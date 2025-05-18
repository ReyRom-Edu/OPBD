
## 🔷 1. `INSERT` — Вставка данных

### 📌 Общий синтаксис:

```sql
INSERT INTO имя_таблицы (столбец1, столбец2, ...)
VALUES (значение1, значение2, ...);
```

### 📌 Пример:

```sql
INSERT INTO Employees (FirstName, LastName, Age)
VALUES ('Ivan', 'Petrov', 30);
```

### 🔸 Вставка нескольких строк:

```sql
INSERT INTO Products (Name, Price)
VALUES 
('Mouse', 25.00),
('Keyboard', 40.00);
```

### 🔸 Вставка через SELECT (копирование данных):

```sql
INSERT INTO ArchiveOrders (OrderID, OrderDate)
SELECT OrderID, OrderDate FROM Orders WHERE Status = 'Completed';
```

---

## 🔷 2. `UPDATE` — Обновление данных

### 📌 Общий синтаксис:

```sql
UPDATE имя_таблицы
SET столбец1 = выражение1,
    столбец2 = выражение2, ...
[WHERE условие];
```

### 📌 Пример:

```sql
UPDATE Employees
SET Age = Age + 1
WHERE Department = 'IT';
```

### 🔸 Обновление по соединению (JOIN):

```sql
UPDATE e
SET e.Salary = e.Salary * 1.10
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales';
```

> ⚠️ Без `WHERE` обновляются **все строки**!

---

## 🔷 3. `DELETE` — Удаление строк

### 📌 Общий синтаксис:

```sql
DELETE FROM имя_таблицы
[WHERE условие];
```

### 📌 Пример:

```sql
DELETE FROM Orders
WHERE OrderDate < '2023-01-01';
```

### 🔸 Удаление по JOIN:

```sql
DELETE o
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.IsInactive = 1;
```

> ⚠️ Без `WHERE` удаляются **все строки** в таблице!

---