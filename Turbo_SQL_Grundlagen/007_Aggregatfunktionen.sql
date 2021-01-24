---- AGGREGATFUNKTIONEN
-- aggregate functions

USE Northwind;

SELECT UnitPrice
FROM Products
ORDER BY UnitPrice

-- zähle, wie viele es insgesamt gibt (77)
SELECT COUNT(ProductID) AS [Anzahl Produkte]
FROM Products

-- in DIESEM Fall kein Unterschied mit DISTINCT; ProductName ist in diesem Fall eindeutig, somit können keine doppelten Einträge weggelassen werden:
SELECT COUNT(DISTINCT ProductName) AS [Anzahl Produkte]
FROM Products


-- in wievielen Ländern haben wir Kunden?
-- nein:
SELECT COUNT(Country)
FROM Customers
-- wieder so viele, wie Kunden!

-- hier müssen wir ein DISTINCT verwenden:
SELECT COUNT(DISTINCT Country)
FROM Customers

-- das sind weniger, als Customers; bei vielen ist keine Region eingetragen
-- es werden aber alle Einträge bei Region gezählt; Doppelte werden auch gezählt!
SELECT COUNT(Region)
FROM Customers

-- Anzahl Regionen mit DISTINCT:
SELECT COUNT(DISTINCT Region)
FROM Customers




-- Durchschnittlicher Unitprice (28.8663)
SELECT AVG(UnitPrice) AS Durchschnittspreis -- AVG = average
FROM Products

-- niedrigster Preis
SELECT MIN(UnitPrice)
FROM Products

-- höchster Preis
SELECT MAX(UnitPrice)
FROM Products


-- Summen:

-- Summe ALLER Frachtkosten:
SELECT SUM(Freight)
FROM Orders
-- 64942,69


-- SUMME Frachtkosten PRO Kunde:
SELECT SUM(Freight) AS Freightsum, CustomerID, ShipCountry
FROM Orders
GROUP BY CustomerID, ShipCountry
-- nur 89 Ergebnisse, weil 2 Kunden haben noch nichts bestellt und somit keine Frachtkosten


-- bringt nix:
SELECT SUM(Freight), CustomerID, OrderID
FROM Orders
GROUP BY CustomerID, OrderID
-- Summe Frachtkosten pro Bestellnummer sind wieder genau die Frachtkosten dieser Bestellung



-- wieviele Kunden gibts PRO Stadt im jeweiligen Land?
-- Country, City, Anzahl Kunden

SELECT *
FROM Customers


SELECT Country, City, COUNT(CustomerID) AS Customers
FROM Customers
GROUP BY Country, City -- PRO ... was? Kunden pro Stadt im jeweiligen Land
ORDER BY Country, City


SELECT SUM(Freight) AS SumFreight, CustomerID, OrderID
FROM Orders
GROUP BY CustomerID, OrderID
ORDER BY SumFreight -- ASC -- DESC


-- ORDER BY mit mehreren Spalten:
SELECT COUNT(CustomerID) AS Kundenanzahl, Country
FROM Customers
GROUP BY Country
ORDER BY Kundenanzahl DESC, Country ASC


