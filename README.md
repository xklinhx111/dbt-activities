# dbt Activities

1. Create a new Google Cloud Project named `dbt-tutorial`.

2. Create a service account for dbt with the appropriate permissions.

   <details>
     <summary>Solution</summary>

   You should give the following roles to the service account:

    - BigQuery Data Editor
    - BigQuery User

   </details>

3. Create a folder called `dbt_tutorial/` and navigate into it.

   <details>
     <summary>Solution</summary>

   ```bash
   mkdir dbt_tutorial
   cd dbt_tutorial
   ```

   </details>

4. Create a new virtual environment using uv, and activate it.

   <details>
     <summary>Solution</summary>

   ```bash
   uv venv
   source .venv/bin/activate
   ```
    
   </details>

5. Install dbt and the BigQuery adapter in your virtual environment.

   <details>
     <summary>Solution</summary>

   ```bash
   uv init
   uv add dbt-bigquery dbt-core
   ```

   </details>

6. Initialize a new dbt project called `dbt_tutorial` and configure your profile to connect to your data warehouse.

   <details>
     <summary>Solution</summary>

   ```bash
   dbt init
   ```

   </details>

7. Move all the files from the generated `dbt_tutorial/` subfolder to your current folder and delete the empty subfolder.

   <details>
     <summary>Solution</summary>

   ```bash
   mv dbt_tutorial/* .  # Move non-hidden files
   mv dbt_tutorial/.* .  # Move hidden files
   rmdir dbt_tutorial
   ```

   </details>

8. Open your dbt project folder as a workspace in VS Code.

9. Check that your connection is working.

   <details>
     <summary>Solution</summary>

   ```bash
   dbt debug
   ```

   </details>

10. Create a commit with an appropriate message.

    <details>
      <summary>Solution</summary>

    ```bash
    git add .
    git commit -m "Initialize dbt project"
    ```

    </details>

11. Push your dbt project to your GitHub repository.

    <details>
      <summary>Solution</summary>

    ```bash
    git remote add origin <YOUR_REPO_URL>
    git push -u origin main
    ```

    </details>

12. Build the example dbt models in your data warehouse.

    <details>
      <summary>Solution</summary>

    ```bash
    dbt run
    ```

    </details>

13. Delete the example models in the `models/` folder, and change the default materialization to `table`.

14. Run the following command to add the Jaffle Shop datasets into a `raw` schema in your data warehouse.

    ```bash
    uv add --dev synthesia
    synthesia jaffle-shop.v1 --target-schema raw --credentials-from-dbt
    ```

15. Create a new branch named `add-dbt-sources` and switch to it.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout -b add-dbt-sources
    ```

    </details>

16. In a `models/sources.yml` file, declare dbt sources for the tables you just loaded. Suppose all your data comes from an e-commerce application called *Jaffle Shop*. Give them appropriate source and table names.

17. Commit and push your branch to GitHub.

    <details>
      <summary>Solution</summary>

    ```bash
    git add models/sources.yml
    git commit -m "Add dbt sources for raw tables"
    git push -u origin add-dbt-sources
    ```

    </details>

18. Create a pull request from your `add-dbt-sources` branch to the `main` branch in GitHub. Add someone as a reviewer, and declare yourself as the assignee.

19. Suppose your pull request is approved. Merge it into `main` using GitHub's interface, and then pull the changes into your local `main` branch.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout main
    git pull
    ```

    </details>

20. Create a new branch named `add-staging-models` and switch to it.

    <details>
      <summary>Solution</summary>

    ```bash
    git checkout -b add-staging-models
    ```

    </details>

21. Create a staging model for customers so that:

    - `id` is renamed to `customer_id`
    - `name` is renamed to `customer_name`

22. Create a staging model for orders so that:

    - `id` is renamed to `order_id`
    - `customer` is renamed to `customer_id`
    - `ordered_at` contains only the date (no time component)

23. Create a staging model for order items so that:

    - `id` is renamed to `order_item_id`
    - `sku` is renamed to `product_id`

24. Create a staging model for stores so that:

    - `id` is renamed to `store_id`
    - `name` is renamed to `store_name`
    - `opened_at` contains only the date (no time component)

25. Create a staging model for supplies so that:

    - `id` is renamed to `supply_id`
    - `sku` is renamed to `product_id`
    - `name` is renamed to `supply_name`
    - `cost` is renamed to `supply_cost`
    - `perishable` is renamed to `is_perishable_supply`

26. Create a staging model for products so that:

    - `sku` is renamed to `product_id`
    - `name` is renamed to `product_name`
    - `type` is renamed to `product_type`
    - `description` is renamed to `product_description`
    - `price` is renamed to `product_price`
    - `is_food_item` is a new column that is true if the product type (which can be `null`) is `"jaffle"` and false otherwise
    - `is_drink_item` is a new column that is true if the product type (which can be `null`) is `"beverage"` and false otherwise

27. Add relevant data tests for the staging model containing customers.

28. Create a model to answer the following question: *How many orders were placed in total?*

29. Create a model to answer the following question: *How many orders were placed by day?*

30. Create a model to answer the following question: *How many orders were placed in each store in total?*

31. Create a model to answer the following question: *What are the top 10 customers by number of orders placed?*

32. Create a model to answer the following question: *How many items were sold by day?*

33. Delete the Google Project.

34. Delete the GitHub repository.

35. Delete your local dbt project folder.

    <details>
      <summary>Solution</summary>

    ```bash
    rm -rf <PATH_TO_YOUR_DBT_PROJECT>
    ```

    </details>
