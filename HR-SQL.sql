SELECT * FROM INFORMATION_SCHEMA.TABLES;
Select * from employee_data;
-- 1) Wie ist die Altersverteilung im Unternehmen?

ALTER TABLE employee_data
ADD age nvarchar(50);
UPDATE employee_data
SET age=DATEDIFF(YEAR,DOB,GETDATE());
select 
min(age) as Youngest,
max(age) as Oldest
From employee_data;
--Altersverteilung
SELECT
  age_group,
  COUNT(*) AS count
FROM (
  SELECT
    CASE
      WHEN age >= 23 AND age <= 35 THEN '23 to 35'
      WHEN age >= 36 AND age <= 50 THEN '36 to 50'
      WHEN age >=51  AND age <= 65 THEN '51-65'
      ELSE '65+'
    END AS age_group
  FROM employee_data
  WHERE ExitDate is null
) AS Subquery
GROUP BY age_group
ORDER BY age_group;
--Geschlechterverteilung
select GenderCode,
count(GenderCode) as count
from employee_data
where ExitDate is null
group by GenderCode
order by GenderCode asc;

--Geschlecht-Abteilung
SELECT DepartmentType, GenderCode, count(*) as count
FROM employee_data
WHERE ExitDate IS NULL
GROUP BY DepartmentType, GenderCode
ORDER BY DepartmentType,GenderCode;

--Geschlecht-Abteilung-JobBeschreibung
SELECT 
DepartmentType, JobFunctionDescription,
GenderCode,
count(GenderCode) AS count
FROM employee_data
WHERE ExitDate IS NULL
GROUP BY DepartmentType,JobFunctionDescription, GenderCode
ORDER BY DepartmentType,JobFunctionDescription, GenderCode ASC;

-- 4) Wie ist die Rassenverteilung im Unternehmen?
select
RaceDesc,
count(*) as count
from employee_data
where ExitDate is null
group by RaceDesc
order by count desc;
--5) Wie hoch ist die durchschnittliche Betriebszugehörigkeit?
SELECT
 AVG(DATEDIFF(year, StartDate, ExitDate)) AS Arbeitszeit
 FROM employee_data
 WHERE ExitDate IS NOT NULL AND ExitDate<= GETDATE();
 ---- 6) Welche Abteilung hat die höchste Fluktuationsrate?
-- Gesamtanzahl 
-- Anzahl der Kündigungen 
-- Anzahl der Kündigungen/Gesamtanzahl
SELECT
 DepartmentType,
 Gesamtanzahl,
 Kundigenzahl,
 round(CAST( Kundigenzahl AS FLOAT)/Gesamtanzahl, 2) AS Fluktuationsrate
FROM 
   (SELECT
   DepartmentType,
   count(*) AS Gesamtanzahl,
   SUM(CASE
        WHEN ExitDate IS NOT NULL AND ExitDate <= getdate()
		THEN 1 ELSE 0
		END
   ) AS Kundigenzahl
  FROM employee_data
  GROUP BY DepartmentType
  ) AS Subquery
ORDER BY Fluktuationsrate DESC;
--- 7) Wie ist die Verteilung der Amtszeiten auf die einzelnen Abteilungen?
SELECT 
    DepartmentType,
    AVG(DATEDIFF(year,StartDate, ExitDate)) AS amtszeit
FROM 
    employee_data
WHERE 
    ExitDate IS NOT NULL 
    AND ExitDate <= GETDATE()
GROUP BY 
    DepartmentType
ORDER BY amtszeit DESC;

-- 9) Wie ist die Verteilung der Beschäftigten auf die verschiedenen Bundesländer?
SELECT
State,
count(*) AS count
FROM employee_data
WHERE ExitDate IS NULL
GROUP BY State
ORDER BY count DESC;
--Verteilung von Jobbeschreibung
SELECT 
 JobFunctionDescription,
 count(*) AS count
FROM employee_data
WHERE ExitDate IS NULL
GROUP BY JobFunctionDescription
ORDER BY count DESC;
--- 11) Wie hat sich die Zahl der eingestellten Mitarbeiter im Laufe der Zeit verändert?
SELECT
  einstell_jahr,
  einstellungen,
  kündigungen,
  einstellungen - kündigungen AS netto_veränderung,
  (ROUND(CAST(einstellungen - kündigungen AS FLOAT) / NULLIF(einstellungen, 0), 2)) * 100 AS prozent_einstellungs_veränderung
FROM  
  (SELECT
    YEAR(StartDate) AS einstell_jahr,
    COUNT(*) AS einstellungen,
    SUM(CASE WHEN ExitDate IS NOT NULL AND ExitDate <= GETDATE() THEN 1 ELSE 0 END) AS kündigungen
  FROM employee_data
  GROUP BY YEAR(StartDate)
  ) AS unterabfrage
ORDER BY prozent_einstellungs_veränderung ASC;
-- Lấy thông tin về hiệu suất và mức lương của nhân viên
-- Tính trung bình đánh giá hiệu suất theo từng mức lương
SELECT 
    PayZone,                                   -- Mức lương
    AVG(CAST([Current_Employee_Rating] AS FLOAT)) AS AvgPerformanceRating,  -- Điểm đánh giá trung bình
    COUNT(*) AS EmployeeCount                  -- Số lượng nhân viên trong mỗi mức lương
FROM 
    employee_data                                    -- Tên bảng dữ liệu nhân sự
WHERE 
    [Current_Employee_Rating] IS NOT NULL      -- Chỉ tính những nhân viên có điểm đánh giá
GROUP BY 
    PayZone                                    -- Nhóm theo mức lương
ORDER BY 
    AvgPerformanceRating DESC;                 -- Sắp xếp theo điểm hiệu suất trung bình từ cao đến thấp


	-- Tính tỷ lệ phần trăm nhân viên theo loại
SELECT 
    EmployeeClassificationType,                                         -- Loại nhân viên
    COUNT(*) AS EmployeeCount,                                          -- Số lượng nhân viên
    ROUND(CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM employee_data) * 100, 2) AS Percentage  -- Tính phần trăm
FROM 
    employee_data
GROUP BY 
    EmployeeClassificationType
ORDER BY 
    EmployeeCount DESC;

-- Mối liên hệ giữa tình trạng hôn nhân, giới tính và trạng thái làm việc
SELECT 
    MaritalDesc,              -- Tình trạng hôn nhân
    GenderCode,               -- Giới tính
    EmployeeClassificationType,           -- Trạng thái làm việc
    COUNT(*) AS EmployeeCount -- Số lượng nhân viên
FROM 
    employee_data
GROUP BY 
    MaritalDesc, 
    GenderCode, 
    EmployeeClassificationType
ORDER BY 
    EmployeeCount DESC;


SELECT
  age_group,GenderCode,
  COUNT(*) AS count
FROM (
  SELECT
    CASE
      WHEN age >= 23 AND age <= 35 THEN '23 to 35'
      WHEN age >= 36 AND age <= 50 THEN '35 to 50'
      WHEN age >= 51 AND age <= 65 THEN '51 to 65'
      ELSE '65+'
    END AS age_group,GenderCode
  FROM employee_data
  WHERE ExitDate IS NULL
) AS Subquery
GROUP BY age_group,GenderCode
ORDER BY age_group,GenderCode;
-- Phân tích EmployeeClassificationType theo từng PayZone và DepartmentType
SELECT 
    DepartmentType,                         -- Loại phòng ban
    SUM(CASE WHEN PayZone = 'Zone A' THEN 1 ELSE 0 END) AS ZoneA,    -- Số nhân viên ở Zone 1
    SUM(CASE WHEN PayZone = 'Zone B' THEN 1 ELSE 0 END) AS ZoneB,    -- Số nhân viên ở Zone 2
    SUM(CASE WHEN PayZone = 'Zone C' THEN 1 ELSE 0 END) AS ZoneC,    -- Số nhân viên ở Zone 3
    -- Số nhân viên ở Zone 5
    EmployeeClassificationType              -- Loại nhân viên (full-time, part-time, temporary)
FROM 
    employee_data
GROUP BY 
    DepartmentType,                         -- Nhóm theo loại phòng ban
    EmployeeClassificationType              -- Nhóm theo loại nhân viên
ORDER BY 
    DepartmentType, EmployeeClassificationType;  -- Sắp xếp theo loại phòng ban và loại nhân viên
--Prozent von TerminationType
SELECT 
    TerminationType, 
    COUNT(*) AS TotalCount,
    ROUND(CAST(COUNT(*) AS FLOAT) / SUM(COUNT(*)) OVER() * 100, 2) AS Procent
FROM 
    employee_data
WHERE 
    ExitDate IS NOT NULL
GROUP BY 
    TerminationType
ORDER BY 
    TotalCount DESC;
