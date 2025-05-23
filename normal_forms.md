# **Нормализация**
## **Первая нормальная форма (1NF)**
### **Требование**:  
- Все атрибуты (столбцы) должны содержать атомарные (неделимые) значения.  
- В таблице не должно быть повторяющихся групп данных.  

### **Примеры нарушения 1NF**:  
1. **Таблица с неатомарными значениями** (перечислением через запятую):  
   | ID | Имя  | Телефоны         |  
   |----|------|------------------|  
   | 1  | Иван | 123-456, 987-654 |  
   | 2  | Олег | 456-789          |  

2. **Таблица с повторяющимися группами**:  
   | ID | Имя  | Телефон1 | Телефон2 |  
   |----|------|---------|---------|  
   | 1  | Иван | 123-456 | 987-654 |  
   | 2  | Олег | 456-789 | NULL    |  

3. **Таблица с вложенными данными (JSON, XML и т. д.)**:  
   | ID | Имя  | Контакты (JSON)            |  
   |----|------|----------------------------|  
   | 1  | Иван | {"телефоны": ["123-456", "987-654"]} |  
   | 2  | Олег | {"телефоны": ["456-789"]}  |  

### **Исправление (Приведение к 1NF)**:
Разделяем таблицу, чтобы каждый телефон был отдельной записью:  
   | ID | Имя  | Телефон  |  
   |----|------|---------|  
   | 1  | Иван | 123-456 |  
   | 1  | Иван | 987-654 |  
   | 2  | Олег | 456-789 |  

---

## **Вторая нормальная форма (2NF)**
### **Требование**:
- База данных должна быть в **1NF**.  
- У каждого неключевого атрибута должна быть **полная функциональная зависимость** от **первичного ключа** (недопустима частичная зависимость).  

### **Примеры нарушения 2NF**:
1. **Таблица заказов, где ключ (OrderID, ProductID), но информация о названии продукта избыточна**:  
   | OrderID | ProductID | ProductName | Quantity |  
   |---------|----------|------------|---------|  
   | 1       | 101      | Чай        | 5       |  
   | 1       | 102      | Кофе       | 3       |  
   | 2       | 101      | Чай        | 2       |  

   Здесь **ProductName** зависит только от **ProductID**, но не от всего составного ключа **(OrderID, ProductID)**.

2. **Таблица студентов с частичной зависимостью от ключа (StudentID, CourseID)**:  
   | StudentID | CourseID | StudentName | CourseName |  
   |-----------|---------|------------|-----------|  
   | 1         | 10      | Иван       | Математика |  
   | 1         | 11      | Иван       | Физика     |  

   **StudentName** зависит только от **StudentID**, а **CourseName** – только от **CourseID**.

3. **Таблица сотрудников с составным ключом (DepartmentID, EmployeeID), но название отдела повторяется**:  
   | DepartmentID | EmployeeID | DepartmentName | EmployeeName |  
   |-------------|-----------|--------------|------------|  
   | 1           | 101       | IT           | Алекс      |  
   | 1           | 102       | IT           | Сергей     |  

   **DepartmentName** зависит только от **DepartmentID**, а не от всего ключа.

### **Исправление (Приведение к 2NF)**:
Разделяем таблицы:  
- Таблица заказов:  
   | OrderID | ProductID | Quantity |  
- Таблица продуктов:  
   | ProductID | ProductName |  

---

## **Третья нормальная форма (3NF)**
### **Требование**:
- База данных должна быть в **2NF**.  
- Все неключевые атрибуты **должны зависеть только от первичного ключа** (исключаем транзитивные зависимости).  

### **Примеры нарушения 3NF**:
1. **Таблица заказов с транзитивной зависимостью (SupplierName зависит от SupplierID, а не от OrderID)**:  
   | OrderID | ProductID | SupplierID | SupplierName |  
   |---------|----------|------------|-------------|  
   | 1       | 101      | 50         | ООО "Продукты" |  
   | 2       | 102      | 51         | ООО "Кофе"    |  

2. **Таблица сотрудников, где ZipCode определяет City и State**:  
   | EmployeeID | Name | ZipCode | City    | State  |  
   |-----------|------|--------|--------|--------|  
   | 1         | Иван | 12345  | Москва | МО     |  
   | 2         | Олег | 54321  | СПб    | СПб    |  

   **City и State зависят от ZipCode, а не от EmployeeID**.

3. **Таблица студентов с вычислимым атрибутом (Age зависит от BirthDate)**:  
   | StudentID | Name | BirthDate  | Age |  
   |-----------|------|-----------|----|  
   | 1         | Иван | 2000-05-15 | 24 |  
   | 2         | Олег | 1998-11-30 | 26 |  

   **Age вычисляется из BirthDate, поэтому его лучше убрать**.

### **Исправление (Приведение к 3NF)**:
- Выносим Supplier в отдельную таблицу:  
   | SupplierID | SupplierName |  
- Таблица заказов теперь содержит только **SupplierID**.

---

## **Бойс-Кодд нормальная форма (BCNF)**

BCNF — это усиленная версия третьей нормальной формы (3NF), которая предотвращает некоторые аномалии, не устраняемые в 3NF.

### **Требование**:
- База данных должна быть в 3NF.
- Каждый детерминант должен быть кандидатным ключом.

Детерминант — это атрибут или группа атрибутов, от которых функционально зависит другой атрибут.

Если в таблице есть детерминант, который не является кандидатом в ключ, то таблица не соответствует BCNF.

### **Пример нарушения BCNF**:
1. **Таблица, где одна колонка определяет другую, но не является ключом**:  
   | ProfessorID | CourseID | Classroom |  
   |------------|---------|----------|  
   | 1          | 10      | 101      |  
   | 1          | 11      | 101      |  
   | 2          | 12      | 102      |  

   Здесь **ProfessorID → Classroom**, но **ProfessorID не является ключом**.

### **Исправление (Приведение к BCNF)**:
Разделяем на две таблицы:
- **Преподаватели и аудитории**:  
   | ProfessorID | Classroom |  
- **Курсы**:  
   | CourseID | ProfessorID |  

---

Это основные нормальные формы. Более строгие (4NF, 5NF) применяются реже и касаются многозначных зависимостей и разложения без потери данных.



### **Когда может потребоваться денормализация?**  

**Денормализация** — это преднамеренное внесение избыточности в базу данных, чтобы **повысить производительность запросов** за счёт уменьшения числа соединений (`JOIN`) между таблицами.  

Хотя **нормализация** помогает **устранить избыточность** и **аномалии обновления**, в реальных системах нормализованные схемы **не всегда эффективны**, особенно в системах с высокими нагрузками.

---

# **Денормализация**  

### 1. **Ускорение сложных запросов (уменьшение количества `JOIN`)**  
**Проблема:**  
- В сильно нормализованной БД для получения данных может требоваться много `JOIN`.  
- Это приводит к снижению скорости запросов, особенно при больших объемах данных.  

**Решение (денормализация):**  
- Добавить **избыточные** поля в таблицы, чтобы сократить количество соединений.  

**Пример:**  

- **Нормализованный вариант (3NF):**  
  - Таблица **Заказы (`Orders`)**  
    | OrderID | CustomerID | Date       |  
    |---------|-----------|-----------|  
    | 1       | 101       | 2024-03-20 |  
    | 2       | 102       | 2024-03-21 |  

  - Таблица **Клиенты (`Customers`)**  
    | CustomerID | Name  | City    |  
    |-----------|------|--------|  
    | 101       | Иван | Москва |  
    | 102       | Анна | СПб    |  

  - Запрос на получение заказов с именами клиентов:  
    ```sql
    SELECT Orders.OrderID, Customers.Name, Orders.Date
    FROM Orders
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
    ```
    - **Минус**: `JOIN` требует дополнительных ресурсов при больших объемах.

- **Денормализованный вариант:**  
  - Добавляем имя клиента прямо в `Orders` (избыточные данные):  
    | OrderID | CustomerID | CustomerName | Date       |  
    |---------|-----------|--------------|-----------|  
    | 1       | 101       | Иван         | 2024-03-20 |  
    | 2       | 102       | Анна         | 2024-03-21 |  

  - Теперь можно получить данные без `JOIN`:  
    ```sql
    SELECT OrderID, CustomerName, Date FROM Orders;
    ```
    - **Плюс**: быстрее, меньше нагрузка на сервер.
    - **Минус**: при изменении имени клиента (`Customers.Name`) **надо обновлять все записи** в `Orders`.

---

### 2. **Уменьшение нагрузки на сервер (`CPU` и `I/O`)**  
Если в нормализованной схеме есть много таблиц и соединений, серверу приходится **делать больше вычислений**, что нагружает процессор и увеличивает задержки.  

**Денормализация** помогает, если:  
- Запросы часто выполняются на чтение (`SELECT`), а обновления (`UPDATE`) редки.  
- Временные задержки критичны (например, в системах реального времени).  

**Пример:**  
В системе новостных статей есть таблицы:  
- **Articles (статьи)**: `ArticleID, Title, Content, AuthorID`  
- **Authors (авторы)**: `AuthorID, Name, Bio`  

Если нужно **часто загружать статьи с именами авторов**, можно **добавить Name прямо в Articles**, чтобы избежать `JOIN`.

---

### 3. **Оптимизация аналитических запросов (`OLAP` и `Big Data`)**  
В аналитических системах (`Data Warehouse`, `OLAP`), где важна скорость агрегации данных, денормализация позволяет **избежать лишних соединений**.  

**Пример:**  
- В интернет-магазине нужно **часто считать сумму продаж по регионам**.  
- Если структура нормализована (`Orders`, `Customers`, `Products`), запрос будет медленным.  
- Денормализованный вариант: создать **предрасчитанную таблицу** (`SalesSummary`), где уже хранятся суммированные данные по регионам.

---

### 4. **Кэширование данных и подготовленные таблицы**  
Некоторые данные могут **редко изменяться**, но **часто использоваться**.  
В этом случае полезно **предрассчитать** их и хранить в отдельной таблице.  

**Пример:**  
- В интернет-магазине нужно **часто выводить "популярные товары"**.  
- Вместо того чтобы **каждый раз вычислять популярность**, можно **ежедневно обновлять таблицу `PopularProducts`**.

---

## **Минусы денормализации**  
1. **Дублирование данных** → увеличивает размер БД.  
2. **Аномалии обновления** → при изменении одного значения надо обновлять **несколько таблиц**.  
3. **Сложность поддержки** → сложнее гарантировать целостность данных.  

### **Когда денормализация оправдана?**  
✅ Когда **важна скорость чтения, а обновления редки**.  
✅ Когда **слишком много `JOIN` в запросах**.  
✅ Когда **нужно ускорить агрегированные отчёты (OLAP, Big Data)**.  
✅ Когда **есть статические данные, которые можно кэшировать**.  

**Вывод:**  
Денормализация — мощный инструмент, но **использовать её нужно осторожно**, только если нормализованная БД приводит к **сильным задержкам и перегрузке сервера**.