Create Database ProA;

USE ProA;

  Create Table PA_ITEM
  (
    Item_ID INT,
    Item_Name VARCHAR(100),
    Item_Desc VARCHAR(1000),
    Brand_ID INT,
    Brand_Name VARCHAR(100),
    Cat_ID INT,
    Cat_Name VARCHAR(100),
    Price_Date DATE,
    Price_Value FLOAT,
	PRIMARY KEY (Item_ID)
  );
