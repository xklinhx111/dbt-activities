# dbt Activities

## Introduction
This set of exercises is designed to guide you through the process of setting up and using dbt (data build tool) with a Google Cloud data warehouse. You will work with an e-commerce dataset from a fictional company called Jaffle Shop to learn how to manage data sources, create staging models, add data tests, and perform analysis.

## Learning Objectives
- Set up a Google Cloud project and configure service accounts with appropriate permissions.
- Initialize and configure a dbt project connected to your data warehouse.
- Load raw data using dbt seeds and declare sources.
- Create and manage staging models to clean and transform raw data.
- Use version control with git, including branching, committing, and creating pull requests.
- Add data tests to ensure data quality.
- Develop marts models and analysis files to answer business questions.
- Understand best practices for dbt project structure and workflow.

---

1. Create a new Google Cloud Project named `dbt-tutorial`.

2. Create a service account for dbt with the appropriate permissions.

   <details>
     <summary>Solution</summary>

   You should give the following roles to the service account:

    - BigQuery Data Editor
    - BigQuery User

   </details>

3. Initialize a new dbt project called `dbt_tutorial` and configure your profile to connect to your data warehouse.

   <details>
     <summary>Solution</summary>

   ```bash
   dbt init --project-name dbt_tutorial
   ```

   </details>

4. Open your dbt project folder as a workspace in Cursor from the command line.

   <details>
     <summary>Solution</summary>

   ```bash
   cursor <PATH_TO_YOUR_DBT_PROJECT>
   ```

   </details>
 
5. Check that your connection is working.

   <details>
     <summary>Solution</summary>

   ```bash
   dbt debug
   ```

   </details>

6. Run the seeds to load the raw data into your data warehouse to have data to work with.

    <details>
      <summary>Solution</summary>
    
    ```bash
    dbt seed
    ```

    </details>

7. Delete the example files for sources, models, seeds, macros, etc. Change the default materialization to build models as tables.

8. Create a commit with an appropriate message.

   <details>
     <summary>Solution</summary>

   ```bash
   git init
   git add .
   git commit -m "Initialize dbt project"
   ```

   </details>

9. Push your dbt project to your GitHub repository.

   <details>
     <summary>Solution</summary>

   ```bash
   git remote add origin <YOUR_REPO_URL>
   git push -u origin main
   ```

   </details>

10. Create a new branch named `add-jaffle-shop-source` and switch to it.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout -b add-jaffle-shop-source
    ```

    </details>

11. Declare dbt sources for the tables you just loaded. Suppose all your data comes from an e-commerce application called *Jaffle Shop*.

12. Commit and push your branch to GitHub.

    <details>
      <summary>Solution</summary>

    ```bash
    git add models/staging/stg_jaffle_shop__sources.yml
    git commit -m "Add dbt source for Jaffle Shop tables"
    git push -u origin add-jaffle-shop-source
    ```

    </details>

13. Create a pull request from your `add-jaffle-shop-source` branch to the `main` branch in GitHub. Add someone as a reviewer, and declare yourself as the assignee.

14. Suppose your pull request is approved. Merge it into `main` using GitHub's interface, and then pull the changes into your local `main` branch.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout main
    git pull
    ```

    </details>

15. Create a new branch named `add-staging-models` and switch to it.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout -b add-staging-models
    ```

    </details>

16. Create a staging model for customers so that:

    - `id` is renamed to `customer_id`
    - `name` is renamed to `customer_name`

17. Create a staging model for orders so that:

    - `id` is renamed to `order_id`
    - `customer` is renamed to `customer_id`
    - `ordered_at` contains only the date (no time component)
    - `subtotal` is renamed to `net_amount`
    - `tax_paid` is renamed to `tax_amount`
    - `order_total` is renamed to `total_amount`

18. Create a staging model for order items so that:

    - `id` is renamed to `order_item_id`
    - `sku` is renamed to `product_id`

19. Create a staging model for stores so that:

    - `id` is renamed to `store_id`
    - `name` is renamed to `store_name`
    - `opened_at` contains only the date (no time component)

20. Create a staging model for supplies so that:

    - `id` is renamed to `supply_id`
    - `sku` is renamed to `product_id`
    - `name` is renamed to `supply_name`
    - `cost` is renamed to `supply_cost`
    - `perishable` is renamed to `is_perishable_supply`

21. Create a staging model for products so that:

    - `sku` is renamed to `product_id`
    - `name` is renamed to `product_name`
    - `type` is renamed to `product_type`
    - `description` is renamed to `product_description`
    - `price` is renamed to `product_price`
    - `is_food_item` is a new column that is true if the product type (which can be `null`) is `"jaffle"` and false otherwise
    - `is_drink_item` is a new column that is true if the product type (which can be `null`) is `"beverage"` and false otherwise

22. Add the `dbt_utils` package to your project, and run the appropriate command to install it.

    <details>
      <summary>Solution</summary>

    ```bash
    dbt deps
    ```

    </details>

23. Add relevant data tests for the staging model containing customers.

24. Add relevant data tests for the staging model containing orders.

25. Add relevant data tests for the staging model containing order items.

26. Add relevant data tests for the staging model containing stores.

27. Add relevant data tests for the staging model containing supplies.

28. Add relevant data tests for the staging model containing products.

29. Add a model that contains all dates between the first order date and the current date. Name this model `dim_dates`.

30. Create a marts model to calculate the total number of orders placed by day for each store.

31. Add a new column to calculate the revenue by day for each store.

32. Add a new column to calculate the number of items sold by day for each store.

33. Create an analysis file to answer the following question: *How many orders were placed in total?*

34. Create an analysis file to answer the following question: *How many orders were placed by day?*

35. Create an analysis file to answer the following question: *How many orders were placed in each store in total?*

36. Create an analysis file to answer the following question: *What are the top 10 customers by number of orders placed?*

37. Create an analysis file to answer the following question: *How many items were sold by day?*

38. Delete the Google Project.

39. Delete the GitHub repository.

40. Delete your local dbt project folder.

    <details>
      <summary>Solution</summary>

    ```bash
    rm -rf <PATH_TO_YOUR_DBT_PROJECT>
    ```

    </details>
