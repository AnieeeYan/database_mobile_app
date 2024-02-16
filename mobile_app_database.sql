
USE app;
 
CREATE TABLE Users_table (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Age INT,
    Gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE Conditionn (
    ConditionID INT PRIMARY KEY AUTO_INCREMENT,
    ConditionName VARCHAR(100) NOT NULL,
    Description TEXT,
    Severity ENUM('Mild', 'Moderate', 'Severe')
);

CREATE TABLE Measurements (
    MeasurementID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ConditionID INT,
    MeasurementType VARCHAR(50) NOT NULL,
    Value DECIMAL(10, 2) NOT NULL,
    MeasurementDateTime DATETIME,
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ConditionID) REFERENCES Conditions(ConditionID)
);

CREATE TABLE Reminders (
    ReminderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ReminderType VARCHAR(50) NOT NULL,
    ReminderDateTime DATETIME,
    Description TEXT,
    Status ENUM('Active', 'Completed'),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE HealthcareProfessionals (
    ProfessionalID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE TreatmentPlan (
    TreatmentPlanID INT PRIMARY KEY AUTO_INCREMENT,
    ConditionID INT,
    PlanDescription TEXT,
    Medications TEXT,
    LifestyleChanges TEXT,
    FOREIGN KEY (ConditionID) REFERENCES Conditions(ConditionID)
);
