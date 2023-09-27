/* Data Cleaning */

-- Standardize date format --
Select
Cast(Date as Date) as Date
From [Project Portfolio]..melb_data 

Update [Project Portfolio]..melb_data 
set DateConverted = Cast (DateConverted as Date);

-- Updating Date column to the dataset --
Alter table [Project Portfolio]..melb_data 
Alter Column Date varchar(255);

Alter Table [Project Portfolio]..melb_data
Add DateConverted date;

-- Joining two colums (Suburb and Address) --
Select Regionname, Suburb, Address,
Concat(suburb,' ',Address) as UpdatedAddress
From [Project Portfolio]..melb_data

Alter table [Project Portfolio]..melb_data 
Add UpdatedAddress varchar(255); 

Update [Project Portfolio]..melb_data set UpdatedAddress=Concat(suburb,' ',Address);

-- Properties that are sold more than once --
Select 
	UpdatedAddress, 
	COUNT(UpdatedAddress) as Duplicates
From [Project Portfolio]..melb_data
Group By UpdatedAddress
Having Count(UpdatedAddress) > 1

-- Populating multiple Columns --
Select Yearbuilt, BuildingArea,
COALESCE(YearBuilt, 0) as YearBuiltwithDefault,
COALESCE(BuildingArea, 0) as BuildingAreawithDefault
From [Project Portfolio]..melb_data

Alter table [Project Portfolio]..melb_data 
Alter column Yearbuilt INT NULL,
Alter column BuildingArea INT NULL;

-- Update existing null values in the multiple columns with 0.
Update [Project Portfolio]..melb_data
Set YearBuilt = 0
Where YearBuilt IS NULL;

Update [Project Portfolio]..melb_data
Set BuildingArea = 0
Where BuildingArea IS NULL;

-- Delete unsued colums --
Select *
From [Project Portfolio]..melb_data

Alter table [Project Portfolio]..melb_data
	drop column Propertycount, Postcode;
