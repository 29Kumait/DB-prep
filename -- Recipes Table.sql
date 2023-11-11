/* Table Designs */




/*   Recipes Table
        Contains details of each recipe.
        Columns: RecipeID, RecipeName, Description (optional), CookingTime (optional), ServingSize (optional).
*/
CREATE TABLE Recipes (
    RecipeID INT PRIMARY KEY,
    RecipeName VARCHAR(255),
    Description TEXT,
    CookingTime INT,
    ServingSize INT
);
/*     Categories Table
        Represents different recipe categories like Japanese, Cake, Vegetarian.
        Columns: CategoryID, CategoryName.*/
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);
/*Ingredients Table
        Stores details of each ingredient.
        Columns: IngredientID, IngredientName, Allergens (optional), AverageCost (optional).*/
CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY,
    IngredientName VARCHAR(255),
    Allergens TEXT,
    AverageCost DECIMAL
);
/*    Steps Table
        Contains the cooking steps.
        Columns: StepID, StepDescription.*/
CREATE TABLE Steps (
    StepID INT PRIMARY KEY,
    StepDescription TEXT
);
/*    RecipeCategory Junction Table
        Manages the many-to-many relationship between recipes and categories.
        Columns: RecipeID, CategoryID.*/
CREATE TABLE RecipeCategory (
    RecipeID INT,
    CategoryID INT,
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


/*    RecipeIngredient Junction Table
        Links recipes with their ingredients and includes quantity.
        Columns: RecipeID, IngredientID, Quantity.*/
CREATE TABLE RecipeIngredient (
    RecipeID INT,
    IngredientID INT,
    Quantity VARCHAR(255),
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID)
);



/*    RecipeStep Table
        Manages the order of steps for each recipe.
        Columns: RecipeID, StepID, StepOrder.*/
CREATE TABLE RecipeStep (
    RecipeID INT,
    StepID INT,
    StepOrder INT,
    FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
    FOREIGN KEY (StepID) REFERENCES Steps(StepID)
);