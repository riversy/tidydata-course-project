# Course Project Cook Book

In this file I will describe the sequense of actions what **prepare_tidy_data()** function proceed.

1.  Load data into variables **X**,**y** and **subject** 
    
    I've created special function ```get_file_path()``` to make it easy. We need just to send folder name, route to the data (**test** or **train**) and id of the variable.

2. Load feature list with descriptions of **X** variable from *features.txt* file. So if dataset will be changed or updated, my code will work anyway.

3. We have dataset keys now, but we need to extract only keys we need (fields with *mean()* and *std()*). ```get_keys_to_extract()``` function will help us to do it. It uses ```filter()``` with regular expression ```mean\(\)|std\(\)``` to get this data. 

4. We have data and keys to extract. Now we may use ```select()``` function to get only neccessary data columns from **X** variable and also ```names()``` to apply proper names to these columns.

5. We need to add activity labels column from variable **y**. But it's not quite descriptive. I would like to make this column as *factor*. 

Here I need to load activity labels from *activity_labels.txt* table file and apply it *y$activity* column. Now it looks awesome. This part will prepare correct *factor* column even if activity list will be changed in the future.

As soon as we have tidy *activity* column we may append it to the **X**

6. There's **subject** column, but it's clean and we may also append it to the **X** variable.

7. I've just made steps from 1 to 6 for **test** and **train** datasets and merhe it into **data** variable.

8. I may groupe the **data** by *activity* and *subject* columns and find average values for other columns. Just use ```summarise_each()``` function for this. 

9. Data is tidy. Just save it.

10. Profit!



