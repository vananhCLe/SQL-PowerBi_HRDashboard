# HR-Dashboard-Dokumentation

## Projektübersicht
Dieses Projekt umfasst die Analyse und Visualisierung von HR-Daten mithilfe von SQL und Power BI. Der Datensatz enthält verschiedene Mitarbeiterattribute, die Einblicke in demografische Strukturen, Abteilungsverteilungen, Mitarbeiterfluktuation und Leistungsbewertungen ermöglichen.

## Inhaltsverzeichnis
1. [Datensatzübersicht](#datensatzübersicht)
2. [Verwendete Technologien](#verwendete-technologien)
3. [Analyse](#analyse)
4. [Visualisierungen](#visualisierungen)
5. [Schlüssel-Erkenntnisse](#schlüssel-erkenntnisse)
6. [Zukünftige Verbesserungen](#zukünftige-verbesserungen)

---

## Datensatzübersicht

* Der Datensatz umfasst die folgenden Spalten:
* Employee ID: Eindeutige Kennung für jeden Mitarbeiter.
* First Name: Der Vorname des Mitarbeiters.
* Last Name: Der Nachname des Mitarbeiters.
* Start Date: Das Datum, an dem der Mitarbeiter im Unternehmen angefangen hat.
* Exit Date: Das Datum, an dem der Mitarbeiter das Unternehmen verlassen hat (falls zutreffend).
* Title: Jobtitel oder Position.
* Supervisor: Name des Vorgesetzten des Mitarbeiters.
* Email: E-Mail-Adresse des Mitarbeiters.
* Business Unit: Abteilung oder Einheit, zu der der Mitarbeiter gehört.
* Employee Status: Aktueller Beschäftigungsstatus (z. B. Aktiv, Gekündigt).
* Employee Type: Art der Beschäftigung (z. B. Vollzeit, Teilzeit).
* Pay Zone: Gehaltsband des Mitarbeiters.
* Employee Classification Type: Klassifikationstyp (z. B. Exempt, Non-exempt).
* Termination Type: Grund für die Kündigung (falls zutreffend).
* Termination Description: Details zum Kündigungsgrund.
* Department Type: Übergeordnete Kategorie der Abteilung.
* Division Description: Organisationseinheit des Mitarbeiters.
* DOB: Geburtsdatum des Mitarbeiters.
* State: Standort des Mitarbeiters.
* Job Function: Primäre Jobfunktion.
* Gender: Geschlecht des Mitarbeiters.
* Location: Physischer Bürostandort.
* Race/Ethnicity: Rasse oder ethnische Zugehörigkeit des Mitarbeiters.
* Marital Status: Familienstand des Mitarbeiters.
* Performance Score: Leistungspunktzahl des Mitarbeiters.
* Current Employee Rating: Aktuelle Bewertung des Mitarbeiters.
---

## Verwendete Technologien
- **SQL**: Für Datenextraktion, Transformation und Analyse.
- **Power BI**: Für die Erstellung von Dashboards und die Visualisierung von Erkenntnissen.

---

## Analyse
### 1. Alters- und Geschlechterstruktur
- Die Mitarbeiter verteilen sich auf verschiedene Altersgruppen, wobei die Seniorengruppe (65+) mit 433 Mitarbeitern die größte ist.
- Die Geschlechterverteilung zeigt in allen drei Lohnzonen (A, B, C) mehr Frauen als Männer.

### 2. Abteilungsverteilung
- Die Produktionsabteilung weist mit 614 Frauen und 392 Männern die größte Geschlechterdisparität auf.
- IT/IS und Verwaltungsbüros haben eine ausgeglichene Geschlechterverteilung.
- Im Vertrieb und in der Softwareentwicklung gibt es mehr männliche Mitarbeiter, während in den Geschäftsführungsbüros keine Frauen beschäftigt sind.

### 3. Beschäftigungsklassifizierung
- Temporäre, Vollzeit- und Teilzeitmitarbeiter sind annähernd gleich verteilt.
- Temporäre Mitarbeiter machen 34,43 % der Belegschaft aus, während Teilzeitmitarbeiter mit 31,9 % den kleinsten Anteil haben.

---

## Visualisierungen
1. **Alters- und Geschlechterverteilung**:
   - Balkendiagramme für Altersgruppen und Geschlechtervergleich.
2. **Abteilungsverteilung**:
   - Kreisdiagramme und gruppierte Balkendiagramme für abteilungsbezogene Verteilungen.
3. **Fluktuation und Leistung**:
   - Fluktuationsrate nach Abteilung.
   - Liniendiagramm mit Einstellungstrends (2018–2023).
   - Kreisdiagramm für Mitarbeiterleistungsbewertungen.

---

## Schlüssel-Erkenntnisse
1. **Vielfalt**:
   - Das Unternehmen weist eine ethnische Vielfalt auf, wobei alle Ethnien jeweils etwa 20 % der Belegschaft ausmachen.
2. **Fluktuationsrate**:
   - Die Geschäftsführungsbüros haben mit 0,79 die höchste Fluktuationsrate.
   - Andere Abteilungen liegen zwischen 0,5 und 0,6.
3. **Leistung**:
   - 78,7 % der Mitarbeiter erfüllen die Erwartungen, während nur 3,1 % in einem Leistungsverbesserungsprogramm (PIP) sind.

---

## Zukünftige Verbesserungen
1. Einbeziehung zusätzlicher Merkmale wie Ausbildung oder Gesundheitsleistungen für reichhaltigere Erkenntnisse.
2. Erforschung fortgeschrittener Vorhersagemodelle, um Fluktuationsraten oder Leistungsbewertungen vorherzusagen.
3. Automatisierung von Datenaktualisierungen für Echtzeit-Dashboard-Einblicke.
